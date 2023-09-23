//
//  MyUniCustomTabBar.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/08/06.
//

import UIKit
import Combine

import CombineCocoa
import SnapKit

final class MyUniCustomTabBar: UIStackView {
  
  private let itemTappedSubject = PassthroughSubject<Int, Never>()
  private var cancelBag = Set<AnyCancellable>()
  var didTapItem: AnyPublisher<Int, Never> {
    itemTappedSubject.eraseToAnyPublisher()
  }
  
  private let homeItem = CustomItemView(with: .home, index: 0)
  private let menuItem = CustomItemView(with: .menu, index: 1)
  private lazy var customItemViews = [homeItem, menuItem]
  
  private let visualEffectView: UIVisualEffectView = {
    let blurEffect = UIBlurEffect(style: .light)
    let v = UIVisualEffectView(effect: blurEffect)
    return v
  }()
  
  init() {
    super.init(frame: .zero)
    setupUI()
    setupConstraints()
    bind()
    didSelectItem(index: 0)
  }
  
  required init(coder: NSCoder) {
    fatalError("Do not use Storyboard.")
  }
  
  private func setupUI() {
    addSubview(visualEffectView)
    backgroundColor = .clear
    alignment = .center
    distribution = .fillEqually
    layer.cornerRadius = 30
    layer.shadowColor = myUniColor(.black_000000)?.cgColor
    layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    layer.shadowOpacity = 0.4
    layer.shadowRadius = 7
    layer.masksToBounds = true
    addArrangedSubviews([homeItem, menuItem])
    customItemViews.forEach {
      $0.clipsToBounds = true
    }
  }
  
  private func bind() {
    homeItem.clearButton.tapPublisher
      .sink { [weak self] in
        guard let self else { return }
        didSelectItem(index: homeItem.index)
      }
      .store(in: &cancelBag)
    
    menuItem.clearButton.tapPublisher
      .sink { [weak self] in
        guard let self else { return }
        didSelectItem(index: menuItem.index)
      }
      .store(in: &cancelBag)
  }
  
  private func setupConstraints() {
    visualEffectView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  private func didSelectItem(index: Int) {
    customItemViews.forEach {
      $0.isSelected = $0.index == index
    }
    itemTappedSubject.send(index)
  }
}
