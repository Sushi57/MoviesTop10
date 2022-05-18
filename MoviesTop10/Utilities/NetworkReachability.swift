
import Alamofire
import Combine

// MARK: NetworkReachability

final class NetworkReachability {
    
    @Published private (set) var isConnected: Bool = true
    
    static let shared = NetworkReachability()
    
    private let reachability = NetworkReachabilityManager(host: REACHABLE_HOST)!
    
    typealias NetworkReachabilityStatus = NetworkReachabilityManager.NetworkReachabilityStatus
    
    private init() {}
    
    /// Start observing reachability changes
    func startListening() {
        reachability.startListening { [weak self] status in
            switch status {
            case .notReachable:
                self?.updateReachabilityStatus(.notReachable)
            case .reachable(let connection):
                self?.updateReachabilityStatus(.reachable(connection))
            case .unknown:
                break
            }
        }
    }
    
    /// Stop observing reachability changes
    func stopListening() {
        reachability.stopListening()
    }
    
    
    /// Updated ReachabilityStatus status based on connectivity status
    ///
    /// - Parameter status: `NetworkReachabilityStatus` enum containing reachability status
    private func updateReachabilityStatus(_ status: NetworkReachabilityStatus) {
        switch status {
        case .notReachable:
            self.isConnected = false
        case .reachable(.ethernetOrWiFi), .reachable(.cellular):
            self.isConnected = true
        case .unknown:
            break
        }
    }
    
    /// returns current reachability status
    var isReachable: Bool {
        return reachability.isReachable
    }
    
    /// returns if connected via cellular
    var isConnectedViaCellular: Bool {
        return reachability.isReachableOnCellular
    }
    
    /// returns if connected via cellular
    var isConnectedViaWiFi: Bool {
        return reachability.isReachableOnEthernetOrWiFi
    }
    
    deinit {
        stopListening()
    }
}
