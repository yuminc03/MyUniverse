//
//  BirthConstellationCollectionCell.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/10/03.
//

import UIKit

import FlexLayout
import PinLayout

/// 탄생 별자리 CollectionView Cell
final class BirthConstellationCollectionCell: UICollectionViewCell {
  private let gradientCircleView: UIView = {
    let v = UIView()
    v.backgroundColor = .clear
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = v.bounds
    gradientLayer.type = .radial
    gradientLayer.colors = [UIColor.systemYellow, UIColor.white]
    gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
    v.layer.addSublayer(gradientLayer)
    v.layer.cornerRadius = (UIScreen.main.bounds.width - 50) / 4
    return v
  }()
  
  private let imageView = UIImageView(image: UIImage(systemName: "person.circle.fill"))
  
  private let constellationNameLabel: UILabel = {
    let v = UILabel()
    v.font = .systemFont(ofSize: 20, weight: .semibold)
    return v
  }()
  
  private let constellationDateLabel: UILabel = {
    let v = UILabel()
    v.font = .systemFont(ofSize: 16, weight: .medium)
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
    backgroundColor = .clear
    gradientCircleView.addSubview(imageView)
  }
  
  private func setupConstraints() {
    contentView.flex.direction(.column).define {
      $0.addItem(gradientCircleView)
        .width((UIScreen.main.bounds.width - 50) / 2)
        .height((UIScreen.main.bounds.width - 50) / 2)
      $0.addItem(constellationNameLabel).marginTop(10)
      $0.addItem(constellationDateLabel).marginTop(5)
    }
    imageView.pin.all(20)
  }
  
  func updateUI(constellation: BirthConstellation) {
    constellationNameLabel.text = constellation.name
    constellationDateLabel.text = constellation.date
  }
}
