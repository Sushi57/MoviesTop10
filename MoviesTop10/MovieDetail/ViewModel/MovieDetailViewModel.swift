import Foundation
import SwiftUI

class MovieDetailViewModel: ObservableObject {
    
    @Published var detail: MovieDetail!
    var dataManager: NetworkManagerProtocol
    
    //MARK: - Init Method NetworkManagerProtocol

    init( dataManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.dataManager = dataManager
    }
    
    //MARK: - API Call
    func getMovieDetails(movieId:String) {
        dataManager.fetchMovieDetails(movieId: movieId, completion: { (movieDetail,error) in
            self.detail  = movieDetail
        })
    }
    
   
    
    //MARK: - Helper Methods
    func fetchGenres() -> String{
        var genres = [String]()
        if let detail = detail {
            detail.genres?.forEach({ genre in
                genres.append(genre.name ?? "")
                
            })
        }
        
        return genres.joined(separator: " * ")
    }
    
    func getRatingRounded() -> String{
        guard let x = detail?.voteAverage else { return "0"}
        let stringRating = String(format:"%.1f", x)
        //print(round(detail.voteAverage! * 1000) / 1000)
        return stringRating
    }
    
    func getRated() -> String {
        guard let x = detail?.adult else { return "NA"}
        if x {
            return "(A|U)"
        }
        return "(U)"
        
    }
}
