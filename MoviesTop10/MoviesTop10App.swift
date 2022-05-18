
import SwiftUI

@main
struct MoviesTop10App: App {
    var body: some Scene {
        
        WindowGroup {
            MovieView().navigationViewStyle(.stack)
            
        }
    }
    init(){
        NetworkReachability.shared.startListening()
    }
    
    
}
