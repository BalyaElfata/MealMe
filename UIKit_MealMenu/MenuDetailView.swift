import UIKit

class MenuDetailView: UIViewController {
    var menu: Menu?
    var menuImage: UIImageView = UIImageView(image: UIImage(systemName: "photo"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = menu?.name
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .systemBackground
        setupMenuImage()
        setupMenuLabel()
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
        
        view.addSubview(menuImage)
        
        NSLayoutConstraint.activate([
            menuImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            menuImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            menuImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            menuImage.heightAnchor.constraint(equalTo: menuImage.widthAnchor)
        ])
    }
    
    func setupMenuLabel() {
        let menuLabel = UILabel()
        menuLabel.text = menu?.label
        menuLabel.font = UIFont.boldSystemFont(ofSize: 16)
        menuLabel.textAlignment = .left
        menuLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(menuLabel)
        
        NSLayoutConstraint.activate([
            menuLabel.topAnchor.constraint(equalTo: menuImage.bottomAnchor, constant: 10),
            menuLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            menuLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    convenience init(menu: Menu?) {
        self.init()
        self.menu = menu
    }
}
