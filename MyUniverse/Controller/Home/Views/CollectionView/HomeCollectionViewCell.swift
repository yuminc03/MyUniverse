//
//  HomeCollectionViewCell.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/19.
//

import UIKit

import FlexLayout
import PinLayout

final class HomeCollectionViewCell: UICollectionViewCell {
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
    contentView.addSubview(titleLabel)
  }
  
  private func setupConstraints() {
    contentView.flex.padding(20, 20).define {
      $0.addItem(titleLabel)
    }
  }
  
  func setUI(titleText: String) {
    titleLabel.text = titleText
  }
}
