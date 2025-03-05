import Foundation
import CoreData

extension SavedMealItem {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedMealItem> {
        return NSFetchRequest<SavedMealItem>(entityName: "SavedMealItem")
    }

    @NSManaged public var name: String?
}

extension SavedMealItem: Identifiable {
    
}
