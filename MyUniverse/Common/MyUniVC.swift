//
//  MyUniViewController.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/12.
//

import UIKit

class MyUniVC: UIViewController {
  
  var navi: MyUniNaviVC {
    guard let navi = navigationController as? MyUniNaviVC else {
      fatalError("Do not Access NavigationController")
    }
    
    return navi
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  private func setupUI() {
    view.backgroundColor = UIColor(resource: R.color.bgColor)
  }
  
  func setNavigationBarTitle(_ text: String) {
    title = text
  }
}
