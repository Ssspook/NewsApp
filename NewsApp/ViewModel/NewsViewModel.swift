import Foundation

class NewsViewModel {
    var newsVM = [ArticleViewModel]()
    var error: NetworkError!
    let reuseID = "news"
    
    func getNews(completionHandler: @escaping ([ArticleViewModel]) -> Void) {
        NetworkManager.shared.fetchNews { response in
            switch response {
            case .failure(let error):
                self.error = error
            case .success(let news):
                let newsVM = news.articles.map(ArticleViewModel.init)
                DispatchQueue.main.async {
                    self.newsVM = newsVM
                    completionHandler(newsVM)
                }
            }
        }
    }
}

 
