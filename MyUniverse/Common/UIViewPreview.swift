#if DEBUG
import SwiftUI

struct UIViewPreview<View: UIView>: UIViewRepresentable {
  private let view: View
  
  init(_ builder: @escaping () -> View) {
    self.view = builder()
  }
  
  func makeUIView(context: Context) -> some UIView {
    return view
  }
  
  func updateUIView(_ view: UIViewType, context: Context) {
    view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    view.setContentHuggingPriority(.defaultHigh, for: .vertical)
  }
}

#endif
