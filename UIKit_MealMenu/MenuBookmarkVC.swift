import UIKit
import CoreData

class MenuBookmarkVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var menus = [SavedMealItem]()
    let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Unable to retrieve AppDelegate")
        }
        return appDelegate.persistentContainer.viewContext
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllMenus()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menu = menus[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menu.name
        return cell
    }
    
    func getAllMenus() {
        do {
            menus = try context.fetch(SavedMealItem.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            // error
        }
    }
    
    func addMenu(name: String) {
        let newMenu = SavedMealItem(context: context)
        newMenu.name = name
        
        do {
            try context.save()
            getAllMenus()
        } catch {
            // error
        }
    }
    
    func deleteMenu(menu: SavedMealItem) {
        context.delete(menu)
        
        do {
            try context.save()
            getAllMenus()
        } catch {
            // error
        }
    }
}
