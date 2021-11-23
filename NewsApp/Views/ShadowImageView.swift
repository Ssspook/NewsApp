import UIKit

final class ShadowView: UIView {
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var baseView: UIView = {
        let baseView = UIView()
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.backgroundColor = .clear
        baseView.layer.shadowColor = UIColor.black.cgColor
        baseView.layer.shadowOffset = CGSize(width: 5, height: 5)
        baseView.layer.shadowOpacity = 0.7
        baseView.layer.shadowRadius = 10.0
        
        return baseView
    }()
    
    init() {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(baseView)
        baseView.addSubview(imageView)
        
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        baseView.layer.shadowPath = UIBezierPath(roundedRect: baseView.bounds, cornerRadius: 10).cgPath
        baseView.layer.shouldRasterize = true
        baseView.layer.rasterizationScale = UIScreen.main.scale
    }
    
    private func setupConstraints() {
        
        [baseView, imageView].forEach { view in
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                view.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)

            ])
        }
    }
}
