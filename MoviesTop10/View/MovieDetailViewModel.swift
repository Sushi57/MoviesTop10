import Foundation
import SwiftUI

class MovieDetailViewModel: ObservableObject {

@Published var detail: MovieDetail!
    
var dataManager: NetworkManagerProtocol
    
init( dataManager: NetworkManagerProtocol = NetworkManager.shared) {
    self.dataManager = dataManager
}

//MARK: - API Call
    func getMovieDetails(movieId:String) {
        dataManager.fetchMovieDetails(movieId: movieId, completion: { (movieDetail,error) in
            self.detail  = movieDetail
          })
      }
    
    func fetchGenres() -> String{
        var genres = [String]()
        detail.genres?.forEach({ genre in
            genres.append(genre.name ?? "")

        })
        return genres.joined(separator: "|")
    }
}
