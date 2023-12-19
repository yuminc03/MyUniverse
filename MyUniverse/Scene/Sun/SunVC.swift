//
//  SunVC.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/12/19.
//

import UIKit

import ComposableArchitecture
import FlexLayout
import PinLayout

struct SunCore: Reducer {
  struct State: Equatable {
    
  }
  
  enum Action {
    
  }
  
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    return .none
  }
}

final class SunVC: TCABaseVC<SunCore> {
  
  private let containerView: UIView = {
    let v = UIView()
    v.backgroundColor = .clear
    return v
  }()
  
  private let imageView = UIImageView(image: UIImage(resource: R.image.solar.sun))
  
  private let titleLabel: UILabel = {
    let v = UILabel()
    v.text = ""
    v.textColor = UIColor(resource: R.color.purple100)
    v.font = .systemFont(ofSize: 20, weight: .semibold)
    return v
  }()
  
  private let descriptionLabel: UILabel = {
    let v = UILabel()
    v.textColor = UIColor(resource: R.color.purple100)
    v.font = .systemFont(ofSize: 16, weight: .medium)
    return v
  }()
  
  init() {
    super.init(store: Store(initialState: SunCore.State()) {
      SunCore()
    })
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraints()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    containerView.pin.all()
  }
  
  private func setupUI() {
    setNavigationBarTitle("태양☀️")
    view.addSubview(containerView)
    view.backgroundColor = UIColor(resource: R.color.bgColor)
  }
  
  private func setupConstraints() {
    
  }
}
