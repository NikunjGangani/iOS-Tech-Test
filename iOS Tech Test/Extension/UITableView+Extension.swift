//
//  UITableView+Extension.swift
//  iOS Tech Test
//
//  Created by Nikunj Gangani on 13/01/23.
//

import Foundation
import UIKit

extension UITableView {
    func registerCell<T: UITableViewCell>(ofType type: T.Type) {
        let cellName = String(describing: T.self)
        
        if Bundle.main.path(forResource: cellName, ofType: "nib") != nil {
            let nib = UINib(nibName: cellName, bundle: Bundle.main)
            
            register(nib, forCellReuseIdentifier: cellName)
        } else {
            register(T.self, forCellReuseIdentifier: cellName)
        }
    }
    
    func dequeueCell<T: UITableViewCell>(ofType type: T.Type) -> T     {
           let cellName = String(describing: T.self)
           return dequeueReusableCell(withIdentifier: cellName) as! T
        }
}
