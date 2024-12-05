import UIKit

class MenuHomepageView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {    let menuImage = UIImageView()
    let menuName = UILabel()
    let menuLabel = UILabel()
    var menuData: [Menu] = []
    
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
        setupCollectionView()
        
        Task {
            do {
                let menuService = MenuService()
                let data = try await menuService.getMenus()
                self.menuData = data.meals
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch {
                print("Failed to fetch data: \(error)")
            }
        }
    }
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - UICollectionViewDataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        // Clear previous content to prevent duplication
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        // Configure the menuImage
//        menuImage.image = UIImage(systemNad(equalToConstant: 80).isActive = true // Example size
        
        let menuList = menuData[indexPath.row]
//        cell.textLabel?.text = menu.name
//        cell.detailTextLabel?.text = menu.label
        
        let menuImage = UIImageView()
        if let url = URL(string: menuList.image) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            menuImage.image = image
                        }
                    }
                }
            }
        }
        
        // Configure the menuName
        let menuName = UILabel()
//        menuName.text = "Menu \(indexPath.item + 1)"
        menuName.text = menuList.name
        menuName.font = UIFont.boldSystemFont(ofSize: 16)
        menuName.textAlignment = .center
        
        // Configure the menuLabel
        let menuLabel = UILabel()
//        menuLabel.text = "Description for Menu \(indexPath.item + 1)"
        menuLabel.text = menuList.label
        menuLabel.font = UIFont.systemFont(ofSize: 14)
        menuLabel.textColor = .gray
        menuLabel.textAlignment = .center
        menuLabel.numberOfLines = 2
        
        // Create a vertical stack view
        let stackView = UIStackView(arrangedSubviews: [menuImage, menuName, menuLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add stack view to the cell's contentView
        cell.contentView.addSubview(stackView)
        
        // Set constraints for the stack view
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: cell.contentView.bottomAnchor, constant: -8)
        ])
        
        // Add border and corner radius to the cell
        cell.contentView.layer.cornerRadius = 8
        cell.contentView.layer.masksToBounds = true
        cell.contentView.layer.borderColor = UIColor.systemGray4.cgColor
        cell.contentView.layer.borderWidth = 1
        
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
    
    // MARK: - UICollectionViewDelegate Method
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Navigate to a different view controller based on indexPath.item
        let selectedItem = indexPath.item + 1
        var destinationViewController: UIViewController
        
        destinationViewController = MenuDetailView(item: selectedItem)
        
        navigationController?.pushViewController(destinationViewController, animated: true)
    }
}
