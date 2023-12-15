//
//  PlanetsVC.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/12/15.
//

import UIKit

import ComposableArchitecture
import FlexLayout
import PinLayout

struct PlanetsCore: Reducer {
  struct State: Equatable {
    
  }
  
  enum Action {
    
  }
  
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    return .none
  }
}

final class PlanetsVC: TCABaseVC<PlanetsCore> {
  private let containerView: UIView = {
    let v = UIView()
    v.backgroundColor = .clear
    return v
  }()
  
  init() {
    let store = Store(initialState: PlanetsCore.State()) {
      PlanetsCore()
    }
    super.init(store: store)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    containerView.pin.all()
  }
  
  private func setupUI() {
    setNavigationBarTitle("행성🪐")
    view.backgroundColor = UIColor(resource: R.color.bgColor)
    view.addSubview(containerView)
    
  }
}
