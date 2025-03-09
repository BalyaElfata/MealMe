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
        try super.tearDownWithError()
    }

    func testNetworkConnectivity() throws {
        let expectation = self.expectation(description: "Fetching data from API")
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            XCTAssertNil(error, "Error should be nil")
            XCTAssertNotNil(data, "Data should not be nil")
            
            if let httpResponse = response as? HTTPURLResponse {
                XCTAssertEqual(httpResponse.statusCode, 200, "HTTP response status code should be 200")
            } else {
                XCTFail("Response was not HTTPURLResponse")
            }
            
            expectation.fulfill()
        }
        
        dataTask.resume()
        
        waitForExpectations(timeout: 10, handler: nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
