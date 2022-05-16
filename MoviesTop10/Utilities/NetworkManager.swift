//
//  NetworkManager.swift
//  MoviesTop10
//
//  Created by SAKSHI TIWARI on 13/05/22.
//

import Foundation
import Alamofire
import Combine

protocol NetworkManagerProtocol {
    func fetchPopularMovies(pageNo:Int,completion: @escaping (MovieListModel,Error?) -> Void)
    func fetchMovieDetails(movieId:String, completion: @escaping (MovieDetail,Error?) -> Void)
    func showIndicator()->Bool
}


class NetworkManager {
    
    static let shared: NetworkManagerProtocol = NetworkManager()
    @Published var isLoading = false

    private init() { }
}

extension NetworkManager: NetworkManagerProtocol {
    
    //MARK: - Show Indicator

    func showIndicator() -> Bool {
        return self.isLoading
    }
    

    //MARK: - Popular Movie  API

    func fetchPopularMovies(pageNo:Int, completion: @escaping (MovieListModel,Error?) -> Void){
    if(NetworkReachability.shared.isReachable){
        guard let url = URL(string: BASE_URL + "movie/popular?" + API_KEY + "&page=\(pageNo)") else {
            return
        }
        self.isLoading = true
        AF.request(url, method: .get, parameters: nil).responseString { response in
            self.isLoading = false
            if response.error != nil {
                return
            }
            switch response.result {
            case .success(let responseString):
                guard  let movieModelObj = MovieListModel(JSONString: "\(responseString)") else { return  }
                completion(movieModelObj, nil)
                break
            case .failure( _):
                break
                
            }
        }
    }
    }
    //MARK: - Movie Details API
    
    func fetchMovieDetails(movieId:String, completion: @escaping (MovieDetail,Error?) -> Void){
    if(NetworkReachability.shared.isReachable){
        guard let url = URL(string: BASE_URL + "movie/\(movieId)?" + API_KEY) else{
            return
        }
        self.isLoading = true
        AF.request(url, method: .get, parameters: nil).responseString { response in
            self.isLoading = false

            if response.error != nil {
                return
            }
            switch response.result {
            case .success(let responseString):
                guard  let movieDetObj = MovieDetail(JSONString: "\(responseString)") else { return  }
                completion(movieDetObj, nil)
                break
            case .failure( _):
                break
                
            }
        }
    }
    }
    
}



