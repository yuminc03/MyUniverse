//
//  SolarSystemCollectionCell.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/19.
//

import UIKit

import FlexLayout
import PinLayout

final class SolarSystemCollectionCell: UICollectionViewCell {
  private let roundedRectangleView: UIView = {
    let v = UIView()
    v.layer.cornerRadius = 10
    v.backgroundColor = myUniColor(.subColor)
    return v
  }()
  
  private let titleLabel: UILabel = {
    let v = UILabel()
    v.textColor = myUniColor(.purple_B080FF)
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
      $0.addItem(roundedRectangleView).height((UIScreen.main.bounds.width - 50) / 2)
      $0.addItem(titleLabel).marginTop(10)
    }
  }
  
  func setUI(titleText: String) {
    titleLabel.text = titleText
  }
}
