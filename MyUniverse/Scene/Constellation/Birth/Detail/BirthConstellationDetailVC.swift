//
//  BirthConstellationDetailVC.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/10/06.
//

import UIKit

import DesignSystem
import ComposableArchitecture
import FlexLayout
import PinLayout

struct BirthConstellationDetailCore: Reducer {
  struct State: Equatable {
    let constellation: BirthConstellations
  }
  
  enum Action {
    
  }
  
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    return .none
  }
}

final class BirthConstellationDetailVC: TCABaseVC<BirthConstellationDetailCore> {
  private let containerView: UIView = {
    let v = UIView()
    v.backgroundColor = .clear
    return v
  }()
  
  private let imageView = UIImageView()
  
  private let dateLabel: UILabel = {
    let v = UILabel()
    v.textColor = .white
    v.font = .systemFont(ofSize: 30)
    return v
  }()
  
  private let contentsLabel: UILabel = {
    let v = UILabel()
    v.textColor = .white
    v.font = .systemFont(ofSize: 18)
    v.numberOfLines = 0
    return v
  }()
  
  init(constellation: BirthConstellations) {
    let store = Store(initialState: BirthConstellationDetailCore.State(constellation: constellation)) {
      BirthConstellationDetailCore()
    }
    super.init(store: store)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraints()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    containerView.pin.all(view.pin.safeArea)
    containerView.flex.layout()
  }
  
  private func setupUI() {
    setNavigationBarTitle("\(viewStore.constellation.name) - \(viewStore.constellation.rawValue.capitalized)")
    view.addSubview(containerView)
    dateLabel.text = viewStore.constellation.dateString
    imageView.image = viewStore.constellation.characterImage
    contentsLabel.text = viewStore.constellation.description
  }
  
  private func setupConstraints() {
    containerView.flex.direction(.column).padding(20).alignItems(.center).define {
      $0.addItem(dateLabel)
      $0.addItem(imageView).width(UIScreen.main.bounds.width - 100).aspectRatio(of: imageView)
      $0.addItem(contentsLabel)
    }
  }
}
