
import Foundation
import Alamofire

//MARK: - NetworkManagerProtocol

protocol NetworkManagerProtocol {
    func fetchPopularMovies(url:URL,pageNo: Int, completion: @escaping (MovieListModel) -> Void, failure: @escaping(String) -> Void)
    func fetchMovieDetails(url:URL,movieId:String, completion: @escaping (MovieDetail) -> Void, failure: @escaping(String) -> Void)
}

//MARK: - NetworkManager

class NetworkManager {
    
    static let shared: NetworkManagerProtocol = NetworkManager()
    private init() { }
}

extension NetworkManager: NetworkManagerProtocol {
    
    //MARK: - Popular Movie  API
    
    func fetchPopularMovies(url:URL,pageNo: Int, completion: @escaping (MovieListModel) -> Void, failure: @escaping(String) -> Void) {
        if(NetworkReachability.shared.isReachable){
            AF.request(url, method: .get, parameters: nil).validate(statusCode: 200..<300)
                .responseString { response in
                    if response.error != nil {
                        failure(MTError.invalidData.genericString)
                        return
                    }
                    switch response.result {
                    case .success(let responseString):
                        guard  let movieModelObj = MovieListModel(JSONString: "\(responseString)") else {  
                            return
                        }
                        completion(movieModelObj)
                    case .failure( _):
                        failure(MTError.invalidResponse.genericString)
                        
                    }
                }
            
        }
        else {
            failure(MTError.networkLost.genericString)
        }
        
    }
    //MARK: - Movie Details API
    
    func fetchMovieDetails(url:URL,movieId:String, completion: @escaping (MovieDetail) -> Void, failure: @escaping(String) -> Void) {
        if(NetworkReachability.shared.isReachable){
            AF.request(url, method: .get, parameters: nil).validate(statusCode: 200..<300)
                .responseString { response in
                    
                    if response.error != nil {
                        failure(MTError.invalidData.genericString)
                        return
                    }
                    switch response.result {
                    case .success(let responseString):
                        guard  let movieDetObj = MovieDetail(JSONString: "\(responseString)") else {
                            return
                        }
                        completion(movieDetObj)
                        
                    case .failure( _):
                        failure(MTError.invalidResponse.genericString)
                        
                    }
                }
        }
        else {
            failure(MTError.networkLost.genericString)
        }
    }
    
}


