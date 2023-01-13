//
//  FruitViewModel.swift
//  iOS Tech Test
//
//  Created by Nikunj Gangani on 13/01/23.
//

import Foundation
import Combine

class FruitViewModel {
    
    private var serviceManager: ServiceManager
    @Published var message: String = ""
    @Published var fruitList = [Fruit]()
    
    init(manager: ServiceManager = ServiceManager()) {
        self.serviceManager = manager
    }
    
    func getFruitsList() {
        serviceManager.getWebService(url: API.fruitList.url) { result in
            switch result {
            case .success(let data):
                if let list = try? JSONDecoder().decode([Fruit].self, from: data) {
                    self.fruitList = list
                }
            case .failure(let error):
                self.message = error.localizedDescription
            }
        }
    }
    
    func cellForRowValue(indexPath: IndexPath) -> Fruit? {
        return fruitList.count == 0 ? nil : fruitList[indexPath.row]
    }
}
