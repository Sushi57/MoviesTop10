//
//  MovieViewModel.swift
//  MoviesTop10
//
//  Created by SAKSHI TIWARI on 13/05/22.
//

import Foundation

class MovieViewModel: ObservableObject {
    
    var movies =  [Movie]()
    var dataManager: NetworkManagerProtocol
    
    init( dataManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.dataManager = dataManager
        getPopularMoviesList()
    }
    
    //MARK: - API Call

    func getPopularMoviesList() {
      dataManager.fetchPopularMovies { (movie,error) in
            self.movies = movie.movies ?? [Movie]()
            print(self.movies)
        }
    }
    
}
