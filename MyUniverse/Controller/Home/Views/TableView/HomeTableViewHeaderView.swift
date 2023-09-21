//
//  HomeTableHeaderView.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/19.
//

import UIKit

import SnapKit

final class HomeTableViewHeaderView: UITableViewHeaderFooterView {
  
  private let stackView: UIStackView = {
    let v = UIStackView()
    v.axis = .horizontal
    return v
  }()
  
  private let titleLabel: UILabel = {
    let v = UILabel()
    v.textColor = .white
    v.font = .systemFont(ofSize: 20, weight: .medium)
    return v
  }()
  
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    setupUI()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("Do not use Storyboard.")
  }
  
  private func setupUI() {
    backgroundColor = .clear
    contentView.addSubview(stackView)
    stackView.addArrangedSubview(titleLabel)
  }
  
  private func setupConstraints() {
    stackView.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(20)
    }
  }
  
  func updateUI(titleText: String) {
    titleLabel.text = titleText
  }
}
