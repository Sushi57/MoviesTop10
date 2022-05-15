
import SwiftUI
import Kingfisher
struct MovieDetailView: View {
    
    @ObservedObject var movieDetailVM = MovieDetailViewModel()
    var movieId: Int
    
    
    init(id: Int) {
        movieId = id
    }
    
    var body: some View
    {
        VStack(spacing:10){
            Spacer()
            KFImage(URL.init(string: "\(IMAGE_BASE_URL)original\(movieDetailVM.detail?.belongsToCollection?.posterPath ?? "NA")"))
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
            
           
         VStack{
            Text(movieDetailVM.detail?.originalTitle ?? "")
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                
             
             Text("Released On : \(movieDetailVM.detail?.releaseDate ?? "")")
                 .fontWeight(.regular)
                 .foregroundColor(.secondary)
                 .lineLimit(2)


             
            }
            /*HStack(spacing:10){
            Text(movieDetailVM.fetchGenres())
                .font(.body)
                .fontWeight(.light)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            }*/
            HStack(spacing:10) {
                Label.init("\(movieDetailVM.detail?.voteCount ?? 0)", systemImage: "star.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("\(movieDetailVM.detail?.runtime ?? 0 ) Min" )
                .font(.subheadline)
                .padding(.horizontal)
                .foregroundColor(.secondary)

              
            }
            Text(movieDetailVM.detail?.overview ?? "")
                .font(.body)
                .padding()
                .multilineTextAlignment(.center)

            
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
            movieDetailVM.getMovieDetails(movieId: "\(movieId)")
        }
    }
    
}
struct MovieDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieDetailView(id: 0)
    }
}
