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
    v.text = "별과 별 사이에 성간 물질이 많이 모여 있어 구름처럼 보이는 것."
    v.textColor = UIColor(resource: R.color.purple100)
    v.font = .systemFont(ofSize: 24, weight: .medium)
    return v
  }()
  
  private let descriptionLabel: UILabel = {
    let v = UILabel()
    v.text = "성간구름 - 우리 은하계 내나 은하계외 성운에서 볼 수 있는 가스·플라스마·우주진의 모임\n성간 물질 - 은하 내의 항성 사이나 항성 바로 근처에 존재하는 물질이나 에너지"
    v.textColor = UIColor(resource: R.color.purple100)
    v.font = .systemFont(ofSize: 16)
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
