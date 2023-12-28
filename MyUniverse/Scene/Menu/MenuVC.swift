//
//  MenuVC.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/08/06.
//

import UIKit

import FlexLayout
import PinLayout

final class MenuVC: MyUniVC {
  private let containerView: UIView = {
    let v = UIView()
    v.backgroundColor = .clear
    return v
  }()
  
  private let noticeLabel: UILabel = {
    let v = UILabel()
    v.text = "오픈 예정입니다🙂"
    v.textColor = .white
    v.font = .systemFont(ofSize: 30, weight: .bold)
    v.textAlignment = .center
    return v
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraints()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    containerView.pin.all(view.pin.safeArea)
    containerView.flex.layout(mode: .adjustHeight)
  }
  
  private func setupUI() {
    setNavigationBarTitle("메뉴")
    view.addSubview(containerView)
    navi.navigationBar.prefersLargeTitles = true
  }
  
  private func setupConstraints() {
    containerView.flex.define {
      $0.addItem(noticeLabel).marginTop(20)
    }
  }
}
