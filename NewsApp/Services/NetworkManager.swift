import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    //MARK: Private fields
    private let imageCache = NSCache<NSString, NSData>()
    
    private let _baseUrl = "https://newsapi.org/v2/"
    
    private let _RUTopHeadline = "top-headlines?country=us"
    
    private init() { }
    
    //MARK: Interface
    public func fetchNews(completionHandler: @escaping (Response) -> ()) {
        let urlString = "\(_baseUrl)\(_RUTopHeadline)&apikey=\(APIKey.key)"
        
        guard let url = URL(string: urlString) else {
            completionHandler(.Failed(error: nil))
            return
        }
        
        AF.request(url, method: .get).validate().responseData { response in
            guard let data = response.data else {
                completionHandler(.Failed(error: nil))
                return
            }
            
            let response = self.JSONparser(withData: data)
        
            completionHandler(response)
        }
    }
    
    public func fetchImage(from urlString: String, completionHandler: @escaping  (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(nil)
            return
        }
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            completionHandler(cachedImage as Data)
        } else {
            AF.request(url, method: .get).validate().responseData { response in
                guard let data = response.data else {
                    completionHandler(nil)
                    return
                }
                self.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
                completionHandler(data)
            }
        }
    }
    //MARK: Private methods
    private func JSONparser(withData data: Data) -> Response {
        do {
            let news = try JSONDecoder().decode(News.self, from: data)
            guard let newsBundle = NewsBundle(articles: news.articles) else {
                return .Failed(error: nil)
            }

            return .Succeed(news: newsBundle)
        } catch {
            return .Failed(error: error)
        }
    }
}
