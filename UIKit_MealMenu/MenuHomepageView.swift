import UIKit

class MenuHomepageView: UIViewController {
    let menu = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Menu"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupMenu()
    }
    
    func setupMenu() {
        view.addSubview(menu)
        
        menu.configuration = .filled()
        menu.configuration?.baseBackgroundColor = .systemGray2
        menu.configuration?.title = "Menu"
        
        menu.addTarget(self, action: #selector(goToMenuDetail), for: .touchUpInside)
        
        menu.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            menu.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menu.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            menu.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    @objc func goToMenuDetail() {
        let menuDetail = MenuDetailView()
        menuDetail.title = "Menu Detail"
        navigationController?.pushViewController(MenuDetailView(), animated: true)
    }
}

