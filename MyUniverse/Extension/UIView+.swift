//
//  UIView+.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/08/06.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            addSubview($0)
        }
    }
}
