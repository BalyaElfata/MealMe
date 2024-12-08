import UIKit

class MenuDetailView: UIViewController {
    var menu: Menu?
    var menuImage: UIImageView = UIImageView(image: UIImage(systemName: "photo"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupMenuImage()
        setupMenuDescription()
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
    
    func setupMenuDescription() {
        let menuDescription = UILabel()
        menuDescription.text = menu?.name
        menuDescription.font = UIFont.boldSystemFont(ofSize: 16)
        menuDescription.textAlignment = .center
        menuDescription.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(menuDescription)
        
        NSLayoutConstraint.activate([
            menuDescription.topAnchor.constraint(equalTo: menuImage.bottomAnchor, constant: 10),
            menuDescription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            menuDescription.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    convenience init(menu: Menu?) {
        self.init()
        self.menu = menu
    }
}
