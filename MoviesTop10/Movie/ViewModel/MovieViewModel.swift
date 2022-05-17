import Foundation

class MovieViewModel: ObservableObject {
    
    @Published var movies: [Movie] =  []
    @Published var isLoading = false
    @Published var errValue: String = ""

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
     guard let url = URL(string: BASE_URL + "movie/popular?" + API_KEY + "&page=\(pageNo)") else {
            self.errValue = MTError.invalidURL.genericString
            return
        }
        isLoading = true
        dataManager.fetchPopularMovies(url:url,pageNo: pageNo) { [weak self] movieObj in
            if let selfRef = self {
                selfRef.isLoading = false
                selfRef.movies  = movieObj.movies ?? [Movie]()
            
            // Pagination (Extended Scope)
            /*self.currentPage += 1
            if self.movies.count < self.perPage {
                self.isLoadedAll = true
            }*/
            // Pagination (Extended Scope)

                
            //Sorting Movies as per Vote Count
            let sortedUsers = selfRef.movies.sorted {
                ($0.voteCount ?? 0) > ($1.voteCount ?? 0)
            }
            
            //Limiting to first 10 element.
            selfRef.movies = Array(sortedUsers.prefix(upTo: 10))
            }
        } failure: { error in
            self.isLoading = false
            self.errValue = error
        }

    }
    
}
