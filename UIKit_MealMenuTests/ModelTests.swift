//
//  ModelTests.swift
//  UIKit_MealMenuTests
//
//  Created by Balya Elfata on 09/03/25.
//

import XCTest
import CoreData
@testable import UIKit_MealMenu

final class ModelTests: XCTestCase {
    var testName: String!
    var context: NSManagedObjectContext!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        testName = "Chicken Cordon Bleu"
        context = {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                fatalError("Unable to retrieve AppDelegate")
            }
            return appDelegate.persistentContainer.viewContext
        }()
    }

    override func tearDownWithError() throws {
        testName = nil
        context = nil
        try super.tearDownWithError()
    }

    func addSavedMenu(name: String) throws {
        let newMenu = SavedMenu(context: context)
        newMenu.name = name
        try context.save()
    }

    func fetchSavedMenu(name: String) throws -> [SavedMenu] {
        let fetchRequest = NSFetchRequest<SavedMenu>(entityName: "SavedMenu")
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        return try context.fetch(fetchRequest)
    }

    func testAddAndFetchSavedMenu() throws {
        try addSavedMenu(name: testName)
        
        let fetchedResults = try fetchSavedMenu(name: testName)
        
        XCTAssertNotNil(fetchedResults)
        XCTAssertEqual(fetchedResults.first?.name, testName)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
