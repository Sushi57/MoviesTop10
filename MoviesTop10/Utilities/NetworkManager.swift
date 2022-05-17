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
}

protocol NetworkManagerProtocol {
    func fetchPopularMovies(pageNo: Int, completion: @escaping (MovieListModel) -> Void, failure: @escaping(Error) -> Void)
    func fetchMovieDetails(movieId:String, completion: @escaping (MovieDetail) -> Void, failure: @escaping(Error) -> Void)
}


class NetworkManager {
    
    static let shared: NetworkManagerProtocol = NetworkManager()
    
    private init() { }
}

extension NetworkManager: NetworkManagerProtocol {
    
    
    //MARK: - Show Indicator
    
    
    //MARK: - Popular Movie  API
    
    func fetchPopularMovies(pageNo: Int, completion: @escaping (MovieListModel) -> Void, failure: @escaping(Error) -> Void) {
        if(NetworkReachability.shared.isReachable){
            guard let url = URL(string: BASE_URL + "movie/popular?" + API_KEY + "&page=\(pageNo)") else {
                failure(APError.invalidURL )
                return
            }
            AF.request(url, method: .get, parameters: nil).validate(statusCode: 200..<300)
                .responseString { response in
                if response.error != nil {
                    failure(APError.invalidData)
                    return
                }
                switch response.result {
                case .success(let responseString):
                    guard  let movieModelObj = MovieListModel(JSONString: "\(responseString)") else {  
                        return
                    }
                    completion(movieModelObj)
                case .failure( _):
                    failure(APError.invalidResponse)
                    
                }
            }

        }
        else {
            failure(APError.networkLost)
        }
        
    }
    //MARK: - Movie Details API
    
    func fetchMovieDetails(movieId:String, completion: @escaping (MovieDetail) -> Void, failure: @escaping(Error) -> Void) {
        NetworkReachability.shared.startListening()
        guard let url = URL(string: BASE_URL + "movie/\(movieId)?" + API_KEY) else{
            failure(APError.invalidURL )

                return
            }
            AF.request(url, method: .get, parameters: nil).validate(statusCode: 200..<300)
             .responseString { response in
                
                if response.error != nil {
                    failure(APError.invalidData)
                    return
                }
                switch response.result {
                case .success(let responseString):
                    guard  let movieDetObj = MovieDetail(JSONString: "\(responseString)") else {
                        return
                    }
                    completion(movieDetObj)
                    
                case .failure( _):
                    failure(APError.invalidResponse)

                }
            }
        
    }
    
}



 
