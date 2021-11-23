import Foundation

enum Response {
    case Failed(error: Error?)
    case Succeed(news: NewsBundle)
}
