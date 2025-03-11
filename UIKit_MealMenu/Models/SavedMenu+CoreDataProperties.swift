import Foundation
import CoreData

extension SavedMenu {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedMenu> {
        return NSFetchRequest<SavedMenu>(entityName: "SavedMenu")
    }

    @NSManaged public var name: String?
}

extension SavedMenu: Identifiable {
    
}
