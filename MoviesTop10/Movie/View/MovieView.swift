
import SwiftUI
import Kingfisher

struct MovieView: View {
    @ObservedObject var movieVM = MovieViewModel()
    var body: some View {
        
        if(movieVM.errValue.count > 0){
            ZStack {
                Color(hexStringToUIColor(hex: "#f8f8f8"))
                    .ignoresSafeArea()
                Spacer()
                VStack {
                    Image("Sad")
                        .resizable()
                        .scaledToFit()
                        .padding(50)
                        .foregroundColor(Color.blue)
                    
                    Text(movieVM.errValue)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(alignment: .center)
                        .padding(20)
                    
                    Spacer()
                }
                
            }
        }
        else {
            NavigationView {
                ZStack {
                    Color(hexStringToUIColor(hex: "#eed2cb"))
                        .ignoresSafeArea()
                    
                    ScrollView {
                        LazyVStack {
                            ForEach(movieVM.movies, id: \.id) { movie in
                                NavigationLink(destination: MovieDetailView(id: movie.id ?? 0)) {
                                    KFImage(URL.init(string: "\(IMAGE_BASE_URL)\(movie.posterPath ?? "NA")"))
                                        .resizable()
                                        .resizable()
                                        .loadDiskFileSynchronously()
                                        .fade(duration: 0.5)
                                        .cornerRadius(10)
                                        .padding(10)
                                        .scaledToFit()
                                    
                                }
                            }
                        }
                    }
                    .navigationTitle("Top 10 Movies")
                    if(movieVM.isLoading){
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle.init(tint: .black))
                            .scaleEffect(2)
                    }
                }
                
            } .onAppear {
                movieVM.getPopularMoviesList(pageNo: 1) { _ in
                    
                }
            }
        }
        
    }
    
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
