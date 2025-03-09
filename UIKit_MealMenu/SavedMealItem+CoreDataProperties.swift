//
//  SavedMealItem+CoreDataProperties.swift
//  UIKit_MealMenu
//
//  Created by Balya Elfata on 26/02/25.
//
//

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
