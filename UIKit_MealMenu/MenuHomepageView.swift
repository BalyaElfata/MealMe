import UIKit

class MenuHomepageView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let menu = UIButton()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Menu"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupMenu()
        setupCollectionView()
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
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: menu.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - UICollectionViewDataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemBlue
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout Method
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2
        let padding: CGFloat = 10
        let totalPadding = padding * (itemsPerRow - 1)
        let availableWidth = collectionView.frame.width - totalPadding
        let itemWidth = availableWidth / itemsPerRow
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    @objc func goToMenuDetail() {
        let menuDetail = MenuDetailView()
        navigationController?.pushViewController(menuDetail, animated: true)
    }
}
