import UIKit

class MenuHomepageView: UIViewController {
    let menu = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenu()
    }
    
    func setupMenu() {
        view.addSubview(menu)
        
        menu.configuration = .filled()
        menu.configuration?.baseBackgroundColor = .systemGray2
        menu.configuration?.title = "Menu"
        
        menu.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            menu.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menu.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            menu.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

