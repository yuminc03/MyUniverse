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
        tabBar.backgroundColor = myUniColor(.subColor)?.withAlphaComponent(0.5)
        tabBar.tintColor = myUniColor(.purple_B080FF)
        tabBar.unselectedItemTintColor = myUniColor(.subColor)
        tabBar.layer.cornerRadius = 10
        
        let mainVC = MyUniNaviVC(rootViewController: HomeVC())
        let mainItem = createCustomTabBarItem(
            itemTitle: "Home",
            itemImage: UIImage(systemName: "house"),
            selectedItemImage: UIImage(systemName: "house.fill"), tag: 0
        )
        mainVC.tabBarItem = mainItem
        self.viewControllers = [mainVC]
    }
    
    private func createCustomTabBarItem(
        itemTitle: String?,
        itemImage: UIImage?,
        selectedItemImage: UIImage?,
        tag: Int
    ) -> UITabBarItem {
        let tabBarItem = UITabBarItem(title: itemTitle, image: itemImage, tag: tag)
        tabBarItem.selectedImage = selectedItemImage
        return tabBarItem
    }
}

extension MyUniTabBarController: UITabBarControllerDelegate {
    
}
