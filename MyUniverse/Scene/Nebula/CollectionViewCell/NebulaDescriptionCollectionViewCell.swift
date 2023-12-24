//
//  NebulaDescriptionCollectionViewCell.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/12/22.
//

import UIKit

import FlexLayout
import PinLayout

final class NebulaDescriptionCollectionViewCell: UICollectionViewCell {
  private let titleLabel: UILabel = {
    let v = UILabel()
    v.textColor = UIColor(resource: R.color.purple200)
    v.font = .systemFont(ofSize: 20)
    v.numberOfLines = 0
    return v
  }()
  
  private let descriptionLabel: UILabel = {
    let v = UILabel()
    v.textColor = UIColor(resource: R.color.purple200)
    v.font = .systemFont(ofSize: 18)
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
    contentView.backgroundColor = .clear
  }
  
  private func setupConstraints() {
    contentView.flex.direction(.column).define {
      $0.addItem(titleLabel)
      $0.addItem(descriptionLabel).marginTop(10)
    }
  }
  
  func updateUI(title: String, description: String) {
    titleLabel.text = title
    descriptionLabel.text = description
  }
}
