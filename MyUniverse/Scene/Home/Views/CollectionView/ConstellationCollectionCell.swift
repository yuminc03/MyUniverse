//
//  ConstellationCollectionCell.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/10/02.
//

import UIKit

import FlexLayout
import PinLayout

final class ConstellationCollectionCell: UICollectionViewCell {
  private let roundedRectangleView: UIView = {
    let v = UIView()
    v.layer.cornerRadius = 10
    v.backgroundColor = UIColor(resource: R.color.purple100)
    return v
  }()
  
  private let titleLabel: UILabel = {
    let v = UILabel()
    v.textColor = UIColor(resource: R.color.purple200)
    v.font = .systemFont(ofSize: 16)
    return v
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
    setupConstraints()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    contentView.flex.layout(mode: .adjustHeight)
  }
  
  override func sizeThatFits(_ size: CGSize) -> CGSize {
    contentView.flex.width(size.width)
    contentView.flex.layout(mode: .adjustHeight)
    return contentView.frame.size
  }
  
  required init?(coder: NSCoder) {
    fatalError("Do not use Storyboard.")
  }
  
  private func setupUI() {
    layer.cornerRadius = 10
    contentView.backgroundColor = .clear
  }
  
  private func setupConstraints() {
    contentView.flex.direction(.column).define {
      $0.addItem(roundedRectangleView).height((UIScreen.main.bounds.width - 40) / 2)
      $0.addItem(titleLabel).marginTop(10)
    }
  }
  
  func setUI(titleText: String) {
    titleLabel.text = titleText
  }
}
