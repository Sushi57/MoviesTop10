//
//  NetworkManager.swift
//  MoviesTop10
//
//  Created by SAKSHI TIWARI on 13/05/22.
//

import Foundation
import Alamofire


protocol NetworkManagerProtocol {
    func fetchPopularMovies(pageNo: Int, completion: @escaping (MovieListModel) -> Void, failure: @escaping(String) -> Void)
    func fetchMovieDetails(movieId:String, completion: @escaping (MovieDetail) -> Void, failure: @escaping(String) -> Void)
}


class NetworkManager {
    
    static let shared: NetworkManagerProtocol = NetworkManager()
    
    private init() { }
}

extension NetworkManager: NetworkManagerProtocol {
    
    
   
    
    //MARK: - Popular Movie  API
    
    func fetchPopularMovies(pageNo: Int, completion: @escaping (MovieListModel) -> Void, failure: @escaping(String) -> Void) {
        if(NetworkReachability.shared.isReachable){
            guard let url = URL(string: BASE_URL + "movie/popular?" + API_KEY + "&page=\(pageNo)") else {
                failure(MTError.invalidURL.genericString )
                return
            }
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

    func fetchMovieDetails(movieId:String, completion: @escaping (MovieDetail) -> Void, failure: @escaping(String) -> Void) {
        if(NetworkReachability.shared.isReachable){
        guard let url = URL(string: BASE_URL + "movie/\(movieId)?" + API_KEY) else{
            failure(MTError.invalidURL.genericString )

                return
            }
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

 
