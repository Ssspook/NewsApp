import UIKit

final class NewsTableViewCell: UITableViewCell {
    var articleVM: ArticleViewModel? {
        didSet {
            if let articleVM = articleVM {
                titleLabel.text = articleVM.title
                NetworkManager.shared.fetchImage(from: articleVM.urlToImage) { data in
                    guard let data = data else { return }
                    
                    DispatchQueue.main.async {
                        self.newsImage.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    
    var newsImageData: Data? {
        didSet {
            if let data = newsImageData {
                newsImage.image = UIImage(data: data)
            }
        }
    }
    
    private lazy var newsImage: ShadowView = {
        let shadowViewImage = ShadowView()
        shadowViewImage.translatesAutoresizingMaskIntoConstraints = false
        
        return shadowViewImage
    }()
    
    private lazy var titleLabel:  UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(titleLabel)
        addSubview(newsImage)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        // news image
        
        NSLayoutConstraint.activate([
            newsImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsImage.topAnchor.constraint(equalTo: topAnchor),
            newsImage.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        // title
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
        
    }
}
