import UIKit

class MenuCard: UIView {
    
    // MARK: - UI Elements
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins-SemiBold", size: 15)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let menuAreaLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins-Regular", size: 11)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let menuTimeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let clockImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "clock")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins-Regular", size: 11)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Properties
    
    var foodTitle: String? {
        didSet {
            nameLabel.text = foodTitle
        }
    }
    
    var cuisineType: String? {
        didSet {
            menuAreaLabel.text = cuisineType
        }
    }
    
    var preparationTime: String? {
        didSet {
            timeLabel.text = preparationTime
        }
    }
    
    var foodImage: UIImage? {
        didSet {
            menuImageView.image = foodImage
        }
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 167, height: 170))
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    // MARK: - Setup
    
    private func setupViews() {
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
    
    // MARK: - Configure
    
    func configure(with title: String, cuisineType: String, preparationTime: String, image: UIImage?) {
        self.foodTitle = title
        self.cuisineType = cuisineType
        self.preparationTime = preparationTime
        self.foodImage = image
    }
}
