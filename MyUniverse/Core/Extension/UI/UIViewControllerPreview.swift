#if DEBUG
import SwiftUI

struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
  private let vc: ViewController
  
  init(_ builder: @escaping () -> ViewController) {
    self.vc = builder()
  }
  
  func makeUIViewController(context: Context) -> some UIViewController {
    return vc
  }
  
  func updateUIViewController(_ vc: UIViewControllerType, context: Context) { }
}

#endif
