import Foundation
import SwiftUI

class MovieDetailViewModel: ObservableObject {
    
    @Published var detail: MovieDetail!
    @Published var isLoading = false
    @Published var errValue: String = ""
    
    var dataManager: NetworkManagerProtocol

    //MARK: - Init Method NetworkManagerProtocol

    init( dataManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.dataManager = dataManager
    }
    
    //MARK: - API Call
    func getMovieDetails(movieId:String) {
        isLoading = true
        dataManager.fetchMovieDetails(movieId: movieId) {[weak self] (movieDetail) in
            if let selfRef = self {
                selfRef.isLoading = false
                selfRef.detail  = movieDetail
            }
        } failure: { error in
            self.isLoading = false
            self.errValue = error.localizedDescription
        }

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
        guard let x = detail?.voteAverage else { return ""}
        let stringRating = String(format:"%.1f", x)
        //print(round(detail.voteAverage! * 1000) / 1000)
        return stringRating
    }
    
    func getRated() -> String {
        guard let x = detail?.adult else { return ""}
        if x {
            return "(A|U)"
        }
        return "(U)"
        
    }
}
