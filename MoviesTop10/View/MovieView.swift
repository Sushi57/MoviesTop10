
import SwiftUI
import Kingfisher
struct MovieView: View {
    @ObservedObject var viewModel = MovieViewModel()
    var body: some View {
        
        
        NavigationView{
            ScrollView{
                ForEach(viewModel.movies, id:\.id){ movie in
                    VStack {
                        KFImage(URL(string: "\(IMAGE_BASE_URL)original\(movie.posterPath ?? "NA")"))
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(5)
                            .onTapGesture {
                            }
                    }
                    .padding(5)
                }
            }.navigationTitle("Top 10 Movies")
        }
        
        
        
    }
    
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
