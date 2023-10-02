//
//  HomeTableHeaderView.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/10/01.
//

import UIKit

import FlexLayout
import PinLayout

final class HomeTableHeaderView: UIView {
  private let containerView: UIView = {
    let v = UIView()
    v.backgroundColor = .clear
    return v
  }()
  
  private let titleLabel: UILabel = {
    let v = UILabel()
    v.text = "내 맘의 별들⭐️"
    v.textColor = .white
    v.font = .systemFont(ofSize: 36, weight: .bold)
    v.numberOfLines = 0
    return v
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
    setupConstraints()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    containerView.pin.all()
    containerView.flex.layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("Do not use Storyboard.")
  }
  
  private func setupUI() {
    backgroundColor = .clear
    addSubview(containerView)
  }
  
  private func setupConstraints() {
    containerView.flex.direction(.column).padding(20, 20).define {
      $0.addItem(titleLabel)
    }
  }
}
