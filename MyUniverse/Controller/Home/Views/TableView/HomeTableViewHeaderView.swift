//
//  HomeTableHeaderView.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/19.
//

import UIKit

import FlexLayout
import PinLayout

final class HomeTableViewHeaderView: UITableViewHeaderFooterView {
  private let titleLabel: UILabel = {
    let v = UILabel()
    v.textColor = .white
    v.font = .systemFont(ofSize: 20, weight: .bold)
    return v
  }()
  
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
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
    contentView.flex.padding(20, 20, 5).define {
      $0.addItem(titleLabel)
    }
  }
  
  func updateUI(titleText: String) {
    titleLabel.text = titleText
  }
}
