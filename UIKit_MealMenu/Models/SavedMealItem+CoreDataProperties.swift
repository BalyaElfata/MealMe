import Foundation
import CoreData

extension SavedMealItem {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedMealItem> {
        return NSFetchRequest<SavedMealItem>(entityName: "SavedMealItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var label: String?
    @NSManaged public var image: String?
    @NSManaged public var instructions: String?
    @NSManaged public var youtubeLink: String?

    @NSManaged public var ingredient1: String?
    @NSManaged public var ingredient2: String?
    @NSManaged public var ingredient3: String?
    @NSManaged public var ingredient4: String?
    @NSManaged public var ingredient5: String?
    @NSManaged public var ingredient6: String?
    @NSManaged public var ingredient7: String?
    @NSManaged public var ingredient8: String?
    @NSManaged public var ingredient9: String?
    @NSManaged public var ingredient10: String?
    @NSManaged public var ingredient11: String?
    @NSManaged public var ingredient12: String?
    @NSManaged public var ingredient13: String?
    @NSManaged public var ingredient14: String?
    @NSManaged public var ingredient15: String?
    @NSManaged public var ingredient16: String?
    @NSManaged public var ingredient17: String?
    @NSManaged public var ingredient18: String?
    @NSManaged public var ingredient19: String?
    @NSManaged public var ingredient20: String?
    
    @NSManaged public var measure1: String?
    @NSManaged public var measure2: String?
    @NSManaged public var measure3: String?
    @NSManaged public var measure4: String?
    @NSManaged public var measure5: String?
    @NSManaged public var measure6: String?
    @NSManaged public var measure7: String?
    @NSManaged public var measure8: String?
    @NSManaged public var measure9: String?
    @NSManaged public var measure10: String?
    @NSManaged public var measure11: String?
    @NSManaged public var measure12: String?
    @NSManaged public var measure13: String?
    @NSManaged public var measure14: String?
    @NSManaged public var measure15: String?
    @NSManaged public var measure16: String?
    @NSManaged public var measure17: String?
    @NSManaged public var measure18: String?
    @NSManaged public var measure19: String?
    @NSManaged public var measure20: String?
}

extension SavedMealItem: Identifiable {
    
}
