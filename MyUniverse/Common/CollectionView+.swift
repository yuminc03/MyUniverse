//
//  CollectionView+.swift
//  LabsProject
//
//  Created by Yumin Chu on 2023/07/07.
//

import UIKit

extension UICollectionView {
    
    func registerItem<T: UICollectionViewCell>(type: T.Type) {
        let identifier = String(describing: type)
        register(type, forCellWithReuseIdentifier: identifier)
    }
    
    func dequeueItem<T: UICollectionViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        let identifier = String(describing: type)
        guard let item = dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T else {
            fatalError("잘못된 identifier입니다..")
        }
        
        return item
    }
}
