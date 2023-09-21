//
//  CustomTabBarItem.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/08/06.
//

import Foundation
import UIKit

enum CustomTabBarItem: String, CaseIterable {
  case home
  case menu
}

extension CustomTabBarItem {
  var viewController: UIViewController {
    switch self {
    case .home:
      return MyUniNaviVC(rootViewController: HomeVC())
      
    case .menu:
      return MyUniNaviVC(rootViewController: MenuVC())
    }
  }
  
  var icon: UIImage? {
    switch self {
    case .home:
      return UIImage(systemName: "house")?
        .withTintColor(.white.withAlphaComponent(0.4), renderingMode: .alwaysOriginal)
      
    case .menu:
      return UIImage(systemName: "line.3.horizontal")?
        .withTintColor(.white.withAlphaComponent(0.4), renderingMode: .alwaysOriginal)
    }
  }
  
  var selectedIcon: UIImage? {
    switch self {
    case .home:
      return UIImage(systemName: "house.fill")?
        .withTintColor(.white, renderingMode: .alwaysOriginal)
      
    case .menu:
      return UIImage(systemName: "line.3.horizontal")?
        .withTintColor(.white, renderingMode: .alwaysOriginal)
    }
  }
  
  var title: String {
    return rawValue.capitalized
  }
}
