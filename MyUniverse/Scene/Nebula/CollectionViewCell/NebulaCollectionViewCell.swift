//
//  NebulaCollectionViewCell.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/12/23.
//

import UIKit

import FlexLayout
import PinLayout

final class NebulaCollectionViewCell: UICollectionViewCell {
  private let roundedRectangleView: UIView = {
    let v = UIView()
    v.layer.cornerRadius = 20
    v.backgroundColor = UIColor(resource: R.color.purple100)
    v.layer.masksToBounds = true
    return v
  }()
  
  private let titleLabel: UILabel = {
    let v = UILabel()
    v.textColor = UIColor(resource: R.color.purple200)
    v.font = .systemFont(ofSize: 18)
    v.numberOfLines = 0
    return v
  }()
  
  private let descriptionLabel: UILabel = {
    let v = UILabel()
    v.textColor = UIColor(resource: R.color.purple200)
    v.font = .systemFont(ofSize: 16)
    v.numberOfLines = 0
    return v
  }()
  
  private let imageView: UIImageView = {
    let v = UIImageView()
    v.layer.cornerRadius = 20
    v.layer.masksToBounds = true
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
      $0.addItem(roundedRectangleView).padding(20).define {
        $0.addItem(imageView).aspectRatio(1.0)
        $0.addItem(titleLabel).marginTop(10)
        $0.addItem(descriptionLabel).marginTop(10)
      }
    }
  }
  
  func updateUI(data: NebulaModel) {
    titleLabel.text = data.name
    descriptionLabel.text = data.description
  }
  
  func updateImage(index: Int) {
    imageView.image = Nebula.allCases[index].image
  }
}
