
import SwiftUI
import Kingfisher

struct MovieView: View {
    @ObservedObject var movieVM = MovieViewModel()
    
    var body: some View {
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
//                                    .aspectRatio(1, contentMode: .fill)
                                    .cornerRadius(10)
                                    .padding(10)
                                    .scaledToFit()
                                   
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
