import Foundation

struct ArticleViewModel {
    let article: Article
    
    var author: String {
        article.author ?? "Unknown"
    }
    
    var title: String {
        article.title ?? " "
    }
    
    var description: String {
        article.articleDescription ?? ""
    }
    
    var url: String {
        article.url ?? ""
    }
    
    var urlToImage: String {
        article.urlToImage ?? "https://www.mtctutorials.com/wp-content/uploads/2018/11/free-news-studio-3d-design-and-breaking-news-text-download.jpg"
    }
}
