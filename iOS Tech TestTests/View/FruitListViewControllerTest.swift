//
//  FruitListViewControllerTest.swift
//  iOS Tech TestTests
//
//  Created by Nikunj Gangani on 13/01/23.
//

import XCTest
@testable import iOS_Tech_Test

class FruitListViewControllerTest: XCTestCase {
    
    private var viewM: FruitViewModel!
    private var fruitController: FruitListViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let viewModel = FruitViewModel(manager: ServiceManager())
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "FruitListViewController") as? FruitListViewController {
            viewM = viewModel
            fruitController = controller
        }
        getFruitData()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewM = nil
        fruitController = nil
        try super.tearDownWithError()
        
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func getFruitData() {
        fruitController.getFruitsAPI()
        viewM.$message.sink { message in
            XCTAssertTrue(message.isEmpty)
        }
    }
}
