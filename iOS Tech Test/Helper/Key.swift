//
//  Key.swift
//  iOS Tech Test
//
//  Created by Nikunj Gangani on 13/01/23.
//

import Foundation

enum API : String {
    static let BaseURL = "\(Bundle.main.object(forInfoDictionaryKey: "BASE_URL") ?? "")"
    case fruitList = "/fruit/all"
    var url : URL {
        get{
            return URL(string: API.BaseURL + self.rawValue)!
        }
    }
}


struct Title {
    static let fruits = "Fruits"
}
