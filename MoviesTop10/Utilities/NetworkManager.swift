//
//  NetworkManager.swift
//  MoviesTop10
//
//  Created by SAKSHI TIWARI on 13/05/22.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    func fetchPopularMovies(completion: @escaping (MovieListModel,Error?) -> Void)
    func fetchMovieDetails(movieId:String, completion: @escaping (MovieDetail,Error?) -> Void)
}


class NetworkManager {
    static let shared: NetworkManagerProtocol = NetworkManager()
    let BASE_URL  = "https://api.themoviedb.org/3/movie/"
    let API_KEY  = "api_key=e31023ca7a07ff97ae8dede026f9a082"
    
    private init() { }
}

extension NetworkManager: NetworkManagerProtocol {

    //MARK: - Popular Movie  API

    func fetchPopularMovies(completion: @escaping (MovieListModel,Error?) -> Void){
        let url = URL(string: BASE_URL + "popular?" + API_KEY)!
        print(url)
        AF.request(url, method: .get, parameters: nil).responseString { response in
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
    //MARK: - Movie Details API
    func fetchMovieDetails(movieId:String, completion: @escaping (MovieDetail,Error?) -> Void){
        let url = URL(string: BASE_URL + "\(movieId)?" + API_KEY)!
        print(url)
        AF.request(url, method: .get, parameters: nil).responseString { response in
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

