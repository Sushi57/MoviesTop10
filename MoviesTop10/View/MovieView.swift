
import SwiftUI
import Kingfisher
struct MovieView: View {
    @ObservedObject var movieVM = MovieViewModel()
    @ObservedObject var movieImageVM = MovieImageViewModel()
    
    var body: some View {
        NavigationView{
            
            List(movieVM.movies, id:\.id){ movie in
                NavigationLink.init(destination: MovieDetailView(selectedMovie:movie)) {
                    KFImage(URL.init(string: "\(IMAGE_BASE_URL)original\(movie.posterPath ?? "NA")"))
                        .resizable()
                        .cornerRadius(10)
                        .scaledToFit()
                }
                
            }
          
            .onAppear(perform:{
            })
            .navigationTitle("Top 10 Movies")
        }
        
        
        
    }
    
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
