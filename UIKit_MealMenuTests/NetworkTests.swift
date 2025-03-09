//
//  UIKit_MealMenuTests.swift
//  UIKit_MealMenuTests
//
//  Created by Balya Elfata on 04/12/24.
//

import XCTest
@testable import UIKit_MealMenu

final class NetworkTests: XCTestCase {
    var urlString: String!
    var url: URL!

    override func setUpWithError() throws {
        try super.setUpWithError()
        urlString = "https://www.themealdb.com/api/json/v1/1/search.php?s=chicken"
        url = URL(string: urlString)
    }

    override func tearDownWithError() throws {
        urlString = nil
        url = nil
    }

    func testExample() throws {
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
