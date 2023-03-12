//
//  MainViewController.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/05.
//

import UIKit

final class MyUniTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTabBarItem()
    }
    
    private func setupView() {
        self.delegate = self
    }
    
    private func setupTabBarItem() {
        let mainVC = MyUniNavigationViewController(rootViewController: HomeViewController())
        let mainItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        mainItem.selectedImage = UIImage(systemName: "house.fill")
        mainVC.tabBarItem = mainItem
            
        self.viewControllers = [mainVC]
    }
}
