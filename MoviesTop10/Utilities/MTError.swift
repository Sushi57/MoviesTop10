
import Alamofire
enum MTError: Error {
    case invalidURL
    case networkLost
    case invalidResponse
    case invalidData
    
    var genericString: String {
        switch self {
        case .invalidURL:
            return "The URL you have sent is not proper 😓"
        case .networkLost:
            return "You seem Ofline ‼️"
            
        case .invalidResponse:
            return "The response seems improper 🤯"
        case .invalidData:
            return  "The resource you requested could not be found ‼️"
        }
    }
}
