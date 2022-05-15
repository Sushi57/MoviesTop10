import Foundation
class MovieViewModel: ObservableObject {
    
    @Published var movies: [Movie] =  []
    
    var isLoadedAll = false
    var currentPage = 0
    let perPage = 20
    var dataManager: NetworkManagerProtocol
    
    init( dataManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.dataManager = dataManager
        getPopularMoviesList(pageNo:1)
    }
    
    //MARK: - API Call
    
    func getPopularMoviesList(pageNo:Int) {
        dataManager.fetchPopularMovies(pageNo:pageNo) { (movie,error) in
            self.movies  = movie.movies ?? [Movie]()
            self.currentPage += 1
            if self.movies.count < self.perPage {
                self.isLoadedAll = true
            }
            let sortedUsers = self.movies.sorted {
                ($0.voteCount ?? 0) > ($1.voteCount ?? 0)
            }
            self.movies = sortedUsers
        }
    }
    
}
