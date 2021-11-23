import Foundation

struct NewsBundle {
    var articles: [Article]
    
    public init?(articles: [Article]) {
        self.articles = articles
    }
}
