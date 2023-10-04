//
//  UIStackView+.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/08/06.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach {
            addArrangedSubview($0)
        }
    }
}
