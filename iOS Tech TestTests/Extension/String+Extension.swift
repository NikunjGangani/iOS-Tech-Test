//
//  String+Extension.swift
//  iOS Tech TestTests
//
//  Created by Nikunj Gangani on 13/01/23.
//

import Foundation

extension String {
    func getDataFromJson() -> Data? {
        guard let fileURL = Bundle(for: iOS_Tech_TestTests.self).url(forResource: self, withExtension: "json") else {
                return nil
            }
            return try? Data(contentsOf: fileURL)
    }
}
