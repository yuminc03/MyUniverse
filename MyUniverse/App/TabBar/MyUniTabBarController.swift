import UIKit
import Combine

import CombineCocoa
import SnapKit

final class MyUniTabBarController: UITabBarController {
  
  let customTabBar = MyUniCustomTabBar()
  private var cancelBag = Set<AnyCancellable>()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraints()
    bind()
  }
  
  private func setupUI() {
    tabBar.isHidden = true
    navigationController?.isNavigationBarHidden = true
    view.addSubview(customTabBar)
    selectedIndex = 0
    let controllers = CustomTabBarItem.allCases.map { $0.viewController }
    setViewControllers(controllers, animated: true)
  }
  
  private func setupConstraints() {
    customTabBar.snp.makeConstraints {
      $0.bottom.leading.trailing.equalToSuperview().inset(20)
      $0.height.equalTo(90)
    }
  }
  
  private func bind() {
    customTabBar.didTapItem
      .sink(receiveValue: selectedTab)
      .store(in: &cancelBag)
  }
  
  private func selectedTab(index: Int) {
    selectedIndex = index
  }
}
