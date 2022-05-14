  
    import SwiftUI

    struct MovieView: View {
    @ObservedObject var viewModel = MovieViewModel()
        let students = ["Harry", "Hermione", "Ron"]
           @State private var selectedStudent = "Harry"

           var body: some View {
               NavigationView {
                   Form {
                       Picker("Select your student", selection: $selectedStudent) {
                           ForEach(viewModel.movies, id: \.id) {
                               Text($0.title ?? "ok")
                           }
                       }
                   }
               }
           }
   /* var body: some View {
      ForEach($viewModel.movies, id: \.id) { movie in
        VStack {
                Text(movie.originalTitle )
                    .foregroundColor(.blue)
                    }
            }
        }*/
    }

    struct MovieView_Previews: PreviewProvider {
     static var previews: some View {
        MovieView()
     }
    }
