
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
