import UIKit

class MenuHomepageView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {    let menuImage = UIImageView()
    let menuName = UILabel()
    let menuLabel = UILabel()
    
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
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        // Clear previous content to prevent duplication
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        // Configure the menuImage
        let menuImage = UIImageView()
        menuImage.image = UIImage(systemName: "photo") // Example image
        menuImage.contentMode = .scaleAspectFit
        menuImage.translatesAutoresizingMaskIntoConstraints = false
        menuImage.heightAnchor.constraint(equalToConstant: 80).isActive = true // Example size
        
        // Configure the menuName
        let menuName = UILabel()
        menuName.text = "Menu \(indexPath.item + 1)"
        menuName.font = UIFont.boldSystemFont(ofSize: 16)
        menuName.textAlignment = .center
        
        // Configure the menuLabel
        let menuLabel = UILabel()
        menuLabel.text = "Description for Menu \(indexPath.item + 1)"
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
    
    @objc func goToMenuDetail() {
        let menuDetail = MenuDetailView()
        navigationController?.pushViewController(menuDetail, animated: true)
    }
}
