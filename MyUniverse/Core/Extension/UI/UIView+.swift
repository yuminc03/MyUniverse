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
