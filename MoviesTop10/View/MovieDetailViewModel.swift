import Foundation

class MovieDetailViewModel: ObservableObject {

@Published var detail: MovieDetail!
var dataManager: NetworkManagerProtocol

init( dataManager: NetworkManagerProtocol = NetworkManager.shared) {
    self.dataManager = dataManager
    getMovieDetails(movieId:"55")
}

//MARK: - API Call
    func getMovieDetails(movieId:String) {
        dataManager.fetchMovieDetails(movieId: movieId, completion: { (movieDetail,error) in
            self.detail  = movieDetail
          })
      }
}
