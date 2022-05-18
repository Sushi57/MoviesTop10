
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
        
        if(movieDetailVM.errValue.count > 0){
            
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
                    
                    Text(movieDetailVM.errValue)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(alignment: .center)
                        .padding(20)
                    
                    Spacer()
                }
                
            }
        }
        else {
            VStack(spacing:10){
                Spacer()
                KFImage(URL.init(string: "\(IMAGE_BASE_URL)\(movieDetailVM.detail?.posterPath ?? "")"))
                    .resizable()
                    .loadDiskFileSynchronously()
                    .cacheOriginalImage()
                    .onFailure { error in
                        
                    }
                    .cornerRadius(10)
                    .scaledToFit()
                
                
                
                VStack{
                    Text("\(movieDetailVM.detail?.originalTitle ?? "")")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    
                    Text("Release Date: \(movieDetailVM.detail?.releaseDate ?? "")")
                        .fontWeight(.regular)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                    
                    
                    
                }
                
                HStack(spacing:10) {
                    Label.init(movieDetailVM.getRatingRounded(), systemImage: "star.fill")
                        .font(.subheadline)
                        .padding(.horizontal)
                        .foregroundColor(.secondary)
                    
                    Text("\(movieDetailVM.detail?.runtime ?? 0 ) Mins" )
                        .font(.subheadline)
                        .padding(.horizontal)
                        .foregroundColor(.secondary)
                    
                    Text("\(movieDetailVM.getRated())")
                        .font(.subheadline)
                        .padding(.horizontal)
                        .foregroundColor(.secondary)
                    
                    
                }
                
                Text(movieDetailVM.fetchGenres())
                    .font(.footnote)
                    .fontWeight(.light)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(10)
                
                
                Text(movieDetailVM.detail?.overview ?? "")
                    .font(.body)
                    .padding()
                    .multilineTextAlignment(.center)
                
                
                Spacer()
                Link(destination: URL(string: SITE_URL)!, label: {
                    Text("Watch Now")
                        .bold()
                        .font(.title2)
                        .frame(width: 280, height: 50, alignment: .center)
                        .background(Color(.systemGreen))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }).padding(20)
                
                if(movieDetailVM.isLoading){
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle.init(tint: .black))
                        .scaleEffect(2)
                }
            }.onAppear{
                movieDetailVM.getMovieDetails(movieId: "\(movieId)") { _ in
                    
                }
            }
        }
    }
}
struct MovieDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieDetailView(id: 0)
    }
}
