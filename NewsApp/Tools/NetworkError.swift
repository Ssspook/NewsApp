import Foundation

enum NetworkError: Error, CustomStringConvertible {
    case urlError
    case dataError
    case serverError
    
    public var description: String {
        switch self {
        case .urlError:
            return "Unable to follow url"
        case .dataError:
            return "Data is corrupted"
        case .serverError:
            return "Server is not responding"
        }
    }
}

