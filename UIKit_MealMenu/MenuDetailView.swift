import UIKit

class MenuDetailView: UIViewController {
//    var item: Int = 1
    var menu: Menu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu Detail"
        view.backgroundColor = .systemBackground
        setupMenuDescription()
    }
    
    func setupMenuDescription() {
        let menuDescription = UILabel()
        menuDescription.text = menu?.name
        menuDescription.font = UIFont.boldSystemFont(ofSize: 16)
        menuDescription.textAlignment = .center
        menuDescription.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(menuDescription)
        
        NSLayoutConstraint.activate([
            menuDescription.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            menuDescription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            menuDescription.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    // Convenience initializer for setting the item
    convenience init(menu: Menu?) {
        self.init()
        self.menu = menu
    }
}
