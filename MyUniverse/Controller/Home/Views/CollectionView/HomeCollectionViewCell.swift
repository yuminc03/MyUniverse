//
//  HomeCollectionViewCell.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/19.
//

import UIKit

import SnapKit

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
  
  required init?(coder: NSCoder) {
    fatalError("Do not use Storyboard.")
  }
  
  private func setupUI() {
    layer.cornerRadius = 10
    contentView.addSubview(titleLabel)
  }
  
  private func setupConstraints() {
    titleLabel.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(20)
      $0.trailing.lessThanOrEqualToSuperview().offset(-20)
      $0.top.equalToSuperview().offset(20)
    }
  }
  
  func setUI(titleText: String) {
    titleLabel.text = titleText
  }
}
