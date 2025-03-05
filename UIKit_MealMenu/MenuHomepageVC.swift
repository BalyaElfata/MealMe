import UIKit

class MenuHomepageVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    private let searchController = UISearchController()
    
    private var menuData: [Menu] = []
    private var filteredMenuData: [Menu] = []
    private var selectedLabels: [String] = []
    
    private let filterButtonsScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Menu"
        
        setupSearchController()
        setupFilterButtons()
        setupCollectionView()
        
        Task {
            do {
                let menuService = MenuService()
                let data = try await menuService.getMenus()
                self.menuData = data.meals
                self.filteredMenuData = self.menuData
                DispatchQueue.main.async {
                    self.setupFilterButtonsContent()
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
            collectionView.topAnchor.constraint(equalTo: filterButtonsScrollView.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - UICollectionViewDataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredMenuData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        let menu = filteredMenuData[indexPath.row]
        
        let menuImage = UIImageView()
        if let url = URL(string: menu.image) {
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
        
        let menuName = UILabel()
        menuName.text = menu.name
        menuName.font = UIFont.boldSystemFont(ofSize: 16)
        menuName.textAlignment = .center
        
        let menuLabel = UILabel()
        menuLabel.text = menu.label
        menuLabel.font = UIFont.systemFont(ofSize: 14)
        menuLabel.textColor = .gray
        menuLabel.textAlignment = .center
        menuLabel.numberOfLines = 2
        
        let stackView = UIStackView(arrangedSubviews: [menuImage, menuName, menuLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        cell.contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: cell.contentView.bottomAnchor, constant: -8)
        ])
        
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
        let itemHeight = UIScreen.main.bounds.size.height * 0.3
        let itemWidth = availableWidth / itemsPerRow
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    // MARK: - UICollectionViewDelegate Method
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMenu = filteredMenuData[indexPath.item]
        let destinationViewController = MenuDetailVC(menu: selectedMenu)
        navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search menu..."
        
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func setupFilterButtons() {
        view.addSubview(filterButtonsScrollView)
        filterButtonsScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            filterButtonsScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            filterButtonsScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterButtonsScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filterButtonsScrollView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupFilterButtonsContent() {
        let uniqueLabels = Set(menuData.map { $0.label }).sorted()
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        
        uniqueLabels.forEach { label in
            let button = UIButton(type: .system)
            button.setTitle(label, for: .normal)
            button.addTarget(self, action: #selector(filterButtonTapped(_:)), for: .touchUpInside)
            button.tag = uniqueLabels.firstIndex(of: label) ?? 0
            stackView.addArrangedSubview(button)
        }
        
        filterButtonsScrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: filterButtonsScrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: filterButtonsScrollView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: filterButtonsScrollView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: filterButtonsScrollView.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: filterButtonsScrollView.heightAnchor)
        ])
    }
    
    @objc func filterButtonTapped(_ sender: UIButton) {
        guard let label = sender.title(for: .normal) else { return }
        
        if selectedLabels.contains(label) {
            selectedLabels.removeAll { $0 == label }
        } else {
            selectedLabels.append(label)
        }
        
        for case let button as UIButton in sender.superview?.subviews ?? [] {
            button.isSelected = selectedLabels.contains(button.title(for: .normal) ?? "")
        }
        
        applyFilters()
    }

    func applyFilters() {
        if selectedLabels.isEmpty {
            filteredMenuData = menuData
        } else {
            filteredMenuData = menuData.filter { selectedLabels.contains($0.label) }
        }
        
        if let searchText = searchController.searchBar.text?.lowercased(), !searchText.isEmpty {
            filteredMenuData = filteredMenuData.filter { $0.name.lowercased().contains(searchText) }
        }
        
        collectionView.reloadData()
    }

}

extension MenuHomepageVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        applyFilters()
    }
}
