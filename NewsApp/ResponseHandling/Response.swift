import Foundation

enum Response {
    case success(news: NewsBundle)
    case failure(error: NetworkError)
}
