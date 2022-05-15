
import SwiftUI
import Kingfisher


struct RemoteImage: View {
    var image: KFImage?
    
    var body: some View {
        image?.resizable()
    }
}


struct MovieImageView: View {
    
    @StateObject private var movieImageVM = MovieImageViewModel()
    var urlString: String
    
    var body: some View {
        RemoteImage(image: movieImageVM.image)
            .onAppear { movieImageVM.load(fromURL: urlString) }
    }
}

final class MovieImageViewModel: ObservableObject {
    
    @Published var image: KFImage? = nil
    
    func load(fromURL url: String) {
        self.image = KFImage(URL(string:url))

    }
}
