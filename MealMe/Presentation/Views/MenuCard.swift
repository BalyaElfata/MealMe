import UIKit

class MenuCard: UIView {
    
    // MARK: - UI Elements
    private let containerView = UIView()
    private let menuImageView = UIImageView()
    private let overlayView = UIView()
    private let gradientLayer = CAGradientLayer()
    private let nameLabel = UILabel()
    private let menuAreaLabel = UILabel()
    private let menuTimeView = UIView()
    private let clockImageView = UIImageView()
    private let timeLabel = UILabel()
    
    // MARK: - Initialization
    
    init(title: String, cuisineType: String, preparationTime: String, image: UIImage? = nil) {
        super.init(frame: CGRect(x: 0, y: 0, width: 167, height: 170))
        setupViews()
        configure(with: title, cuisineType: cuisineType, preparationTime: preparationTime, image: image)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    // MARK: - Setup
    
    private func setupViews() {
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 16
        containerView.clipsToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        menuImageView.contentMode = .scaleAspectFill
        menuImageView.clipsToBounds = true
        menuImageView.translatesAutoresizingMaskIntoConstraints = false
        
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.withAlphaComponent(0.7).cgColor
        ]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        nameLabel.font = UIFont(name: "Poppins-SemiBold", size: 15)
        nameLabel.textColor = .white
        nameLabel.numberOfLines = 0
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        menuAreaLabel.font = UIFont(name: "Poppins-Regular", size: 11)
        menuAreaLabel.textColor = .white
        menuAreaLabel.translatesAutoresizingMaskIntoConstraints = false
        
        menuTimeView.translatesAutoresizingMaskIntoConstraints = false
        
        clockImageView.image = UIImage(systemName: "clock")
        clockImageView.contentMode = .scaleAspectFit
        clockImageView.tintColor = .white
        clockImageView.translatesAutoresizingMaskIntoConstraints = false
        
        timeLabel.font = UIFont(name: "Poppins-Regular", size: 11)
        timeLabel.textColor = .white
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.1
        
        addSubview(containerView)
        containerView.addSubview(menuImageView)
        containerView.addSubview(overlayView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(menuAreaLabel)
        containerView.addSubview(menuTimeView)
        
        menuTimeView.addSubview(clockImageView)
        menuTimeView.addSubview(timeLabel)
        
        overlayView.layer.insertSublayer(gradientLayer, at: 0)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            menuImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            menuImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            menuImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            menuImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            overlayView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            overlayView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.5),
            
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            nameLabel.bottomAnchor.constraint(equalTo: menuAreaLabel.topAnchor, constant: -4),
            
            menuAreaLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            menuAreaLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            
            menuTimeView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            menuTimeView.centerYAnchor.constraint(equalTo: menuAreaLabel.centerYAnchor),
            
            clockImageView.leadingAnchor.constraint(equalTo: menuTimeView.leadingAnchor),
            clockImageView.centerYAnchor.constraint(equalTo: menuTimeView.centerYAnchor),
            clockImageView.widthAnchor.constraint(equalToConstant: 16),
            clockImageView.heightAnchor.constraint(equalToConstant: 16),
        
            timeLabel.leadingAnchor.constraint(equalTo: clockImageView.trailingAnchor, constant: 4),
            timeLabel.centerYAnchor.constraint(equalTo: menuTimeView.centerYAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: menuTimeView.trailingAnchor)
        ])
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Update gradient layer frame when view layout changes
        gradientLayer.frame = overlayView.bounds
    }
    
    // MARK: - Configuration
    
    func configure(with title: String, cuisineType: String, preparationTime: String, image: UIImage?) {
        nameLabel.text = title
        menuAreaLabel.text = cuisineType
        timeLabel.text = preparationTime
        menuImageView.image = image
    }
    
    // Setter for food image that triggers layout update
    var foodImage: UIImage? {
        get { return menuImageView.image }
        set {
            menuImageView.image = newValue
            setNeedsLayout()
        }
    }
}
