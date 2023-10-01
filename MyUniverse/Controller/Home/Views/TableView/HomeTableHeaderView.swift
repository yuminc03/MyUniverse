//
//  HomeTableHeaderView.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/10/01.
//

import UIKit

import SnapKit

final class HomeTableHeaderView: UIView {
  private let containerStackView: UIStackView = {
    let v = UIStackView()
    v.axis = .horizontal
    v.spacing = 0
    return v
  }()
  
  private let titleLabel: UILabel = {
    let v = UILabel()
    v.text = "내 맘의 별들⭐️"
    v.textColor = .white
    v.font = .systemFont(ofSize: 36, weight: .bold)
    v.numberOfLines = 0
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
    backgroundColor = .clear
    addSubview(containerStackView)
    containerStackView.addArrangedSubview(titleLabel)
  }
  
  private func setupConstraints() {
    containerStackView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview().inset(20)
    }
  }
}
