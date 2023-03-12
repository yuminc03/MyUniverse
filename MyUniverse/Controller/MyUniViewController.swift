//
//  MyUniViewController.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/12.
//

import UIKit

class MyUniViewController: UIViewController {
    
    var navi: MyUniNavigationViewController? {
        return navigationController as? MyUniNavigationViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(named: "MainColor")
        self.navigationController?.isNavigationBarHidden = true
    }
}
