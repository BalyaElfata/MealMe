import UIKit

class MenuDetailView: UIViewController {
    var menu: Menu?
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    var menuImage: UIImageView = UIImageView(image: UIImage(systemName: "photo"))
    var menuLabel: UILabel = UILabel()
    let menuIngredientsTitle = UILabel()
    let menuIngredients = UILabel()
    let menuInstructionsTitle = UILabel()
    let menuInstructions = UILabel()
    let menuLinkStackView: UIStackView = UIStackView()
    let menuLinkLabel: UILabel = UILabel()
    let menuLinkButton: UIButton = UIButton()
    let youtubeIcon: UIImage? = UIImage(named: "youtubeIcon")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = menu?.name
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .systemBackground
        
        setupScrollView()
        setupMenuImage()
        setupMenuLabel()
        setupMenuIngredients()
        setupMenuInstructions()
        setupMenuLink()
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func setupMenuImage() {
        menuImage.contentMode = .scaleAspectFit
        menuImage.translatesAutoresizingMaskIntoConstraints = false
        
        if let imageURL = menu?.image, let url = URL(string: imageURL) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.menuImage.image = image
                        }
                    }
                }
            }
        }
        
        contentView.addSubview(menuImage)
        
        NSLayoutConstraint.activate([
            menuImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            menuImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            menuImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            menuImage.heightAnchor.constraint(equalTo: menuImage.widthAnchor)
        ])
    }
    
    func setupMenuLabel() {
        menuLabel.text = menu?.label
        menuLabel.font = UIFont.boldSystemFont(ofSize: 16)
        menuLabel.textAlignment = .left
        menuLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(menuLabel)
        
        NSLayoutConstraint.activate([
            menuLabel.topAnchor.constraint(equalTo: menuImage.bottomAnchor, constant: 10),
            menuLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            menuLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    func setupMenuIngredients() {
        menuIngredientsTitle.text = "Ingredients"
        menuIngredientsTitle.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        menuIngredientsTitle.textAlignment = .left
        menuIngredientsTitle.translatesAutoresizingMaskIntoConstraints = false
        
        menuIngredients.text = menu?.ingredients
        menuIngredients.font = UIFont.systemFont(ofSize: 14)
        menuIngredients.textAlignment = .left
        menuIngredients.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(menuIngredientsTitle)
        contentView.addSubview(menuIngredients)
        
        NSLayoutConstraint.activate([
            menuIngredientsTitle.topAnchor.constraint(equalTo: menuLabel.bottomAnchor, constant: 10),
            menuIngredientsTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            menuIngredientsTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            menuIngredients.topAnchor.constraint(equalTo: menuIngredientsTitle.bottomAnchor, constant: 0),
            menuIngredients.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            menuIngredients.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    func setupMenuInstructions() {
        menuInstructionsTitle.text = "Instructions"
        menuInstructionsTitle.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        menuInstructionsTitle.textAlignment = .left
        menuInstructionsTitle.translatesAutoresizingMaskIntoConstraints = false
        
        menuInstructions.text = menu?.instructions
        menuInstructions.numberOfLines = 0
        menuInstructions.font = UIFont.systemFont(ofSize: 14)
        menuInstructions.textAlignment = .left
        menuInstructions.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(menuInstructionsTitle)
        contentView.addSubview(menuInstructions)
        
        NSLayoutConstraint.activate([
            menuInstructionsTitle.topAnchor.constraint(equalTo: menuIngredients.bottomAnchor, constant: 10),
            menuInstructionsTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            menuInstructionsTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            menuInstructions.topAnchor.constraint(equalTo: menuInstructionsTitle.bottomAnchor, constant: 0),
            menuInstructions.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            menuInstructions.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    func setupMenuLink() {
        let textHeight: CGFloat = UIFont.boldSystemFont(ofSize: 16).lineHeight
        let resizedIcon = UIGraphicsImageRenderer(size: CGSize(width: textHeight, height: textHeight)).image { _ in
            youtubeIcon?.draw(in: CGRect(origin: .zero, size: CGSize(width: textHeight, height: textHeight)))
        }
        
        var menuButtonConfiguration = UIButton.Configuration.plain()
        menuButtonConfiguration.attributedTitle = AttributedString(
            "Available on the YouTube",
            attributes: AttributeContainer([.font: UIFont.boldSystemFont(ofSize: 16)]))
        menuButtonConfiguration.baseForegroundColor = .black
        menuButtonConfiguration.image = resizedIcon
        menuButtonConfiguration.imagePadding = 8
        menuButtonConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        menuLinkButton.configuration = menuButtonConfiguration
        menuLinkButton.imageView?.contentMode = .scaleAspectFit
        menuLinkButton.contentHorizontalAlignment = .trailing
        
        menuLinkButton.semanticContentAttribute = .forceRightToLeft

        menuLinkButton.translatesAutoresizingMaskIntoConstraints = false

        menuLinkButton.addTarget(self, action: #selector(menuLinkButtonTapped), for: .touchUpInside)

        contentView.addSubview(menuLinkButton)

        NSLayoutConstraint.activate([
            menuLinkButton.topAnchor.constraint(equalTo: menuInstructions.bottomAnchor, constant: 10),
            menuLinkButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            menuLinkButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            menuLinkButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    @objc func menuLinkButtonTapped() {
        guard let youtubeLink = menu?.youtubeLink, let url = URL(string: youtubeLink) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    convenience init(menu: Menu?) {
        self.init()
        self.menu = menu
    }
}
