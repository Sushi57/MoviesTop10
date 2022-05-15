
import SwiftUI
import Kingfisher

struct MovieView: View {
    @ObservedObject var movieVM = MovieViewModel()
    @ObservedObject var movieImageVM = MovieImageViewModel()
    
    var body: some View {
        /*NavigationView{
            
            List(movieVM.movies, id:\.id){ movie in
                NavigationLink.init(destination: MovieDetailView(selectedMovie:movie)) {
                    KFImage(URL.init(string: "\(IMAGE_BASE_URL)original\(movie.posterPath ?? "NA")"))
                        .resizable()
                        .cornerRadius(10)
                        .scaledToFit()
                }
                .listRowBackground(Color.clear)
                
            }
          
            .onAppear(perform:{
            })
            .navigationTitle("Top 10 Movies")
        }*/
        
        NavigationView {
            ZStack {
                Color(hexStringToUIColor(hex: "#eed2cb"))
                    .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack {
                        ForEach(movieVM.movies, id: \.id) { movie in
                            NavigationLink(destination: MovieDetailView(id: movie.id ?? 0)) {
                                KFImage(URL.init(string: "\(IMAGE_BASE_URL)original\(movie.posterPath ?? "NA")"))
                                    .resizable()
                                    .cornerRadius(10)
                                    .scaledToFit()
                                    .padding(10)
                                   
                            }
                        }
                    }
                }
                .navigationTitle("Top 10 Movies")
               
                
            }
            
        } .onAppear {
            movieVM.getPopularMoviesList(pageNo: 1)
        }
        
    }
    
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
