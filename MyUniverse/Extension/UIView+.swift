//
//  UIView+.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/08/06.
//

import UIKit
import SwiftUI

extension UIView {
  
  func addSubviews(_ views: [UIView]) {
    views.forEach {
      addSubview($0)
    }
  }
  
  func preview() -> some View {
    UIViewPreview {
      self
    }
  }
}
