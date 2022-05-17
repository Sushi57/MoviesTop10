//
//  MTError.swift
//  MoviesTop10
//
//  Created by SAKSHI TIWARI on 17/05/22.
//

import Alamofire
enum MTError: Error {
    case invalidURL
    case networkLost
    case invalidResponse
    case invalidData
    
    var genericString: String {
        switch self {
        case .invalidURL:
            return "The URL you have sent is not proper 😓"
        case .networkLost:
            return "You seem Ofline ‼️"

        case .invalidResponse:
            return "The response seems improper 🤯"
        case .invalidData:
            return  "Reasponse data can't be read ‼️"
        }
    }
}
