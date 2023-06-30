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
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(named: "mainColor")
        self.navigationController?.isNavigationBarHidden = true
    }
}
