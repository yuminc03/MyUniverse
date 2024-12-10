//
//  TableView+.swift
//  LabsProject
//
//  Created by Yumin Chu on 2023/06/25.
//

import UIKit

extension UITableView {
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(type: T.Type) {
        let identifier = String(describing: type)
        register(type, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    func registerCell<T: UITableViewCell>(type: T.Type) {
        let identifier = String(describing: type)
        register(type, forCellReuseIdentifier: identifier)
    }
    
    func dequeueHeaderFooter<T: UITableViewHeaderFooterView>(type: T.Type) -> T {
        let identifier = String(describing: type)
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: identifier) as? T else {
            fatalError("잘못된 identifier입니다..")
        }
        
        return view
    }
    
    func dequeueCell<T: UITableViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        let identifier = String(describing: type)
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("잘못된 identifier입니다..")
        }
        
        return cell
    }
}
