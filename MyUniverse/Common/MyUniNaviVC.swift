//
//  MyUniNavigationViewController.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/12.
//

import UIKit

final class MyUniNaviVC: UINavigationController {
  var tabBar: MyUniCustomTabBar? {
    guard let tabBarController = parent as? MyUniTabBarController else {
      return nil
    }
    
    return tabBarController.customTabBar
  }
  
  private let navigationBarAppearance: UINavigationBarAppearance = {
    let v = UINavigationBarAppearance()
    v.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(resource: R.color.purple200)!]
    v.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(resource: R.color.purple200)!]
    return v
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  private func setupUI() {
    hidesBottomBarWhenPushed = true
    navigationBar.standardAppearance = navigationBarAppearance
    interactivePopGestureRecognizer?.isEnabled = true
    interactivePopGestureRecognizer?.delegate = self
  }
  
  override func pushViewController(_ viewController: UIViewController, animated: Bool) {
    super.pushViewController(viewController, animated: animated)
    tabBar?.isHidden = viewControllers.count > 1
  }
  
  override func popViewController(animated: Bool) -> UIViewController? {
    tabBar?.isHidden = viewControllers.count - 1 > 1
    return super.popViewController(animated: animated)
  }
}

extension MyUniNaviVC: UIGestureRecognizerDelegate {
  func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    return viewControllers.count > 1
  }
}
