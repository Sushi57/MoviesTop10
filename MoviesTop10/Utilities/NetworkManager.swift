//
//  NetworkManager.swift
//  MoviesTop10
//
//  Created by SAKSHI TIWARI on 13/05/22.
//

import Foundation
import Alamofire

enum APError: Error {
    case invalidURL
    case networkLost
    case invalidResponse
    case invalidData
    
    var genericString: String {
        switch self {
        case .invalidURL:
            return "The URL you have sent is not proper."
        case .networkLost:
            return "You seem Ofline!"

        case .invalidResponse:
            return "The response seems improper"
        case .invalidData:
            return  "Data can't be read."
        }
    }
}

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
                failure(APError.invalidURL.genericString )
                return
            }
            AF.request(url, method: .get, parameters: nil).validate(statusCode: 200..<300)
                .responseString { response in
                if response.error != nil {
                    failure(APError.invalidData.genericString)
                    return
                }
                switch response.result {
                case .success(let responseString):
                    guard  let movieModelObj = MovieListModel(JSONString: "\(responseString)") else {  
                        return
                    }
                    completion(movieModelObj)
                case .failure( _):
                    failure(APError.invalidResponse.genericString)
                    
                }
            }

        }
        else {
            failure(APError.networkLost.genericString)
        }
        
    }
    //MARK: - Movie Details API

    func fetchMovieDetails(movieId:String, completion: @escaping (MovieDetail) -> Void, failure: @escaping(String) -> Void) {
        if(NetworkReachability.shared.isReachable){
        guard let url = URL(string: BASE_URL + "movie/\(movieId)?" + API_KEY) else{
            failure(APError.invalidURL.genericString )

                return
            }
            AF.request(url, method: .get, parameters: nil).validate(statusCode: 200..<300)
             .responseString { response in
                
                if response.error != nil {
                    failure(APError.invalidData.genericString)
                    return
                }
                switch response.result {
                case .success(let responseString):
                    guard  let movieDetObj = MovieDetail(JSONString: "\(responseString)") else {
                        return
                    }
                    completion(movieDetObj)
                    
                case .failure( _):
                    failure(APError.invalidResponse.genericString)

                }
            }
       }
    else {
        failure(APError.networkLost.genericString)
    }
  }

}

 
