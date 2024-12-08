import UIKit

class MenuDetailView: UIViewController {
    var menu: Menu?
    let scrollView = UIScrollView()
    let contentView = UIView()
    var menuImage: UIImageView = UIImageView(image: UIImage(systemName: "photo"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = menu?.name
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .systemBackground
        
        setupScrollView()
        setupMenuImage()
        setupMenuLabel()
        
        contentView.addSubview(UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 1000)))
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
        let menuLabel = UILabel()
        menuLabel.text = menu?.label
        menuLabel.font = UIFont.boldSystemFont(ofSize: 16)
        menuLabel.textAlignment = .left
        menuLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(menuLabel)
        
        NSLayoutConstraint.activate([
            menuLabel.topAnchor.constraint(equalTo: menuImage.bottomAnchor, constant: 10),
            menuLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            menuLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            menuLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    convenience init(menu: Menu?) {
        self.init()
        self.menu = menu
    }
}
