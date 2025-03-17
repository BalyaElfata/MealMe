import UIKit

class MenuHomepageVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    private let searchController = UISearchController()
    
    private var viewModel: MenuViewModel!
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
        
        setupBookmarkListButton() // delete
        setupSearchController()
        setupFilterButtons()
        setupCollectionView()
        viewModel = MenuViewModel()
        Task {
            await viewModel.loadMenu()
            menuData = viewModel.menus
            filteredMenuData = menuData
            collectionView.reloadData()
            setupFilterButtonsContent()
        }
    }
    
    func setupBookmarkListButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .bookmarks,
            target: self,
            action: #selector(handleBookmarkListButton))
    }
    
    @objc func handleBookmarkListButton() {
        let destinationViewController = MenuBookmarkVC()
        navigationController?.pushViewController(destinationViewController, animated: true)
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
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
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
        
        let menuCard = MenuCard(frame: .zero)
        menuCard.translatesAutoresizingMaskIntoConstraints = false
        
        menuCard.configure(
            with: menu.name,
            cuisineType: menu.label,
            preparationTime: "\(menu.cookingTime ?? 30) mins",
            image: nil
        )
        
        if let url = URL(string: menu.image) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            menuCard.foodImage = image
                        }
                    }
                }
            }
        }
        
        cell.contentView.addSubview(menuCard)
        
        NSLayoutConstraint.activate([
            menuCard.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
            menuCard.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
            menuCard.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
            menuCard.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor)
        ])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let totalItemWidth: CGFloat = 167 * 2
        let horizontalInset = max((collectionView.bounds.width - totalItemWidth) / 3, 0)
        
        return UIEdgeInsets(top: 10, left: horizontalInset, bottom: 10, right: horizontalInset)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout Method
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 167, height: 170)
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
}

extension MenuHomepageVC: UISearchResultsUpdating {
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
            stackView.leadingAnchor.constraint(equalTo: filterButtonsScrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: filterButtonsScrollView.trailingAnchor),
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
    
    func updateSearchResults(for searchController: UISearchController) {
        applyFilters()
    }
}
