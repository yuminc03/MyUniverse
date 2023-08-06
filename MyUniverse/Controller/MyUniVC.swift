//
//  MyUniViewController.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/12.
//

import UIKit

class MyUniVC: UIViewController {
    
    var navi: MyUniNaviVC? {
        return navigationController as? MyUniNaviVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = myUniColor(.mainColor)
        navigationController?.isNavigationBarHidden = true
    }
}
