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
    v.clipsToBounds = true
    return v
  }()
  
  private let gradientLayer: CAGradientLayer = {
    let v = CAGradientLayer()
    v.type = .radial
    v.colors = [UIColor.systemYellow.cgColor, UIColor.white.cgColor]
    v.startPoint = CGPoint(x: 0.5, y: 0.5)
    v.endPoint = CGPoint(x: 1.0, y: 1.0)
    return v
  }()
  
  private let imageView = UIImageView()
  
  private let constellationNameLabel: UILabel = {
    let v = UILabel()
    v.textColor = .white
    v.font = .systemFont(ofSize: 20, weight: .semibold)
    return v
  }()
  
  private let constellationDateLabel: UILabel = {
    let v = UILabel()
    v.textColor = .white
    v.font = .systemFont(ofSize: 16, weight: .medium)
    return v
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
    setupConstraints()
  }
  
  override func draw(_ rect: CGRect) {
    gradientLayer.frame = gradientCircleView.bounds
    gradientCircleView.layer.cornerRadius = rect.width / 2
    gradientCircleView.layer.insertSublayer(gradientLayer, at: 0)
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
  
  override func prepareForReuse() {
    super.prepareForReuse()
    setNeedsDisplay()
  }
  
  required init?(coder: NSCoder) {
    fatalError("Do not use Storyboard.")
  }
  
  private func setupUI() {
    backgroundColor = .clear
  }
  
  private func setupConstraints() {
    contentView.flex.direction(.column).define {
      $0.addItem(gradientCircleView).aspectRatio(1).define {
          $0.addItem(imageView)
        }
      $0.addItem().direction(.column).define {
        $0.addItem(constellationNameLabel).marginTop(10)
        $0.addItem(constellationDateLabel).marginTop(5)
      }
    }
  }
  
  func updateUI(constellation: BirthConstellation) {
    constellationNameLabel.text = constellation.name
    constellationDateLabel.text = constellation.date
    imageView.image = UIImage(named: constellation.imageName)
  }
}
