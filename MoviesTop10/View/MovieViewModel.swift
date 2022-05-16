import Foundation
class MovieViewModel: ObservableObject {
    
    @Published var movies: [Movie] =  []
    var dataManager: NetworkManagerProtocol
    
    //MARK: - Pagination (Extended Scope)
    /*var isLoadedAll = false
    var currentPage = 0
    let perPage = 10*/
    
    //MARK: -
    
    //MARK: - Init Method NetworkManagerProtocol
    
    init( dataManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.dataManager = dataManager
    }
    
    //MARK: - API Call
    
    func getPopularMoviesList(pageNo:Int) {
        dataManager.fetchPopularMovies(pageNo:pageNo) { (movie,error) in
            self.movies  = movie.movies ?? [Movie]()
            
            // Pagination (Extended Scope)
            /*self.currentPage += 1
            if self.movies.count < self.perPage {
                self.isLoadedAll = true
            }*/
            // Pagination (Extended Scope)

            
            //Sorting Movies as per Vote Count
            let sortedUsers = self.movies.sorted {
                ($0.voteCount ?? 0) > ($1.voteCount ?? 0)
            }
            
            //Limiting to first 10 element.
            self.movies = Array(sortedUsers.prefix(upTo: 10))
        }
    }
    
}
