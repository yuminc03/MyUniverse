//
//  SeasonConstellationCollectionCell.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/12/09.
//

import UIKit

import DesignSystem
import FlexLayout
import PinLayout

final class SeasonConstellationCollectionCell: UICollectionViewCell {
  private let roundedRectangleView: UIView = {
    let v = UIView()
    v.layer.cornerRadius = 10
    v.backgroundColor = DesignSystem.myUniColor(.purple100)
    return v
  }()
  
  private let titleLabel: UILabel = {
    let v = UILabel()
    v.textColor = DesignSystem.myUniColor(.purple200)
    v.font = .systemFont(ofSize: 16)
    return v
  }()
  
  private let descriptionLabel: UILabel = {
    let v = UILabel()
    v.textColor = DesignSystem.myUniColor(.purple100)
    v.font = .systemFont(ofSize: 14)
    v.numberOfLines = 0
    return v
  }()
  
  private let imageView = UIImageView()
  
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
      $0.addItem(roundedRectangleView).define {
        $0.addItem(imageView).height(100)
        $0.addItem(titleLabel).marginTop(10)
        $0.addItem(descriptionLabel).marginTop(10)
      }
    }
  }
  
  func updateUI(data: SeasonConstellation) {
    titleLabel.text = data.name
    descriptionLabel.text = data.description
    imageView.image = UIImage(named: data.imageName)
  }
}
