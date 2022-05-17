//
//  MoviesTop10App.swift
//  MoviesTop10
//
//  Created by SAKSHI TIWARI on 13/05/22.
//

import SwiftUI

@main
struct MoviesTop10App: App {
    var body: some Scene {
        
        WindowGroup {
            MovieView()
            
        }
    }
    init(){
        NetworkReachability.shared.startListening()
    }
    
    
}
