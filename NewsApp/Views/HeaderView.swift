import UIKit

final class HeaderView: UIView {
    private var fontSize: CGFloat
    
    //MARK: Header label
    private lazy var headingLabel: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = "News"
        
        header.font = UIFont.boldSystemFont(ofSize: fontSize)
        return header
    }()
    
    //MARK: Header images
    private lazy var headerCircleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        imageView.image = UIImage(systemName: "largecircle.fill.circle", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        
        return imageView
    }()
    
    private lazy var plusImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        imageView.image = UIImage(systemName: "plus", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)

        return imageView
    }()
    
    //MARK: Horizontial stack view for header images
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [headerCircleImage, headingLabel, plusImage])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    //MARK: Bottom headline
    private lazy var subheadLine: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(fontSize)
        label.text = "Top Headlines"
        label.textColor = .gray
        
        return label
    }()
    
    init(fontSize: CGFloat) {
        self.fontSize = fontSize
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        addSubview(headerStackView)
        addSubview(subheadLine)

         setupConstraints()
    }
    
    private func setupConstraints() {
        
        // news header
        NSLayoutConstraint.activate ([
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerStackView.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        // bottom text
        NSLayoutConstraint.activate ([
            subheadLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            subheadLine.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 8),
            subheadLine.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
