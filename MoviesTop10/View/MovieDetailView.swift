
import SwiftUI
import Kingfisher
struct MovieDetailView: View {
    @ObservedObject var movieDetailVM = MovieDetailViewModel()
    var selectedMovie:Movie
    var body: some View
    {
        VStack(spacing:10){
            Spacer()
            KFImage(URL.init(string: "\(IMAGE_BASE_URL)original\(movieDetailVM.detail.belongsToCollection?.posterPath ?? "NA")"))
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
            
            Text(movieDetailVM.detail.originalTitle ?? "")
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Text(movieDetailVM.fetchGenres())
                .font(.title3)
                .fontWeight(.light)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            HStack(spacing:20) {
                Label.init("\(movieDetailVM.detail.voteCount ?? 0)", systemImage: "star.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
               Spacer()
                Text("Released : \(movieDetailVM.detail.releaseDate ?? "") | \(movieDetailVM.detail.runtime ?? 0 )Min")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Text(selectedMovie.overview ?? "")
                .font(.body)
                .padding()
            
            Spacer()
            Link(destination: URL(string: "https://www.themoviedb.org/movie")!, label: {
                Text("Watch Now")
                    .bold()
                    .font(.title2)
                    .frame(width: 280, height: 50, alignment: .center)
                    .background(Color(.red))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                
                
            })
            
        }.onAppear{
            movieDetailVM.getMovieDetails(movieId: "\(selectedMovie.id ?? 0)")
        }
    }
    
}
struct MovieDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieDetailView(selectedMovie: Movie(coder: NSCoder.init()))
    }
}
