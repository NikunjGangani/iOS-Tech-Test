//
//  FruitViewModelTest.swift
//  iOS Tech TestTests
//
//  Created by Nikunj Gangani on 13/01/23.
//

import Foundation
import XCTest
import Combine

class FruitViewModelTest: XCTestCase {
    
    var viewM: FruitViewModel!
    private var cancellable: Set<AnyCancellable> = []
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        viewM = FruitViewModel(manager: ServiceManager())
        viewM.getFruitsList()
    }
    
    override func tearDownWithError() throws {
        viewM = nil
        try super.tearDownWithError()
    }
    
    func testTableViewFirstCellData() {
        viewM.$fruitList.sink { list in
            guard list.count > 0 else { return }
            let indexPath = IndexPath(row: 0, section: 0)
            let firstObject = self.viewM.cellForRowValue(indexPath: indexPath)
            XCTAssertEqual(firstObject?.name ?? "", "Apple")
        }.store(in: &cancellable)
    }
    
}
