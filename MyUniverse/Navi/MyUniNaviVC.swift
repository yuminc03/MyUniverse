//
//  MyUniNavigationViewController.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/12.
//

import UIKit

final class MyUniNaviVC: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.contains(viewController) { return }
        super.pushViewController(viewController, animated: animated)
    }
    
}
