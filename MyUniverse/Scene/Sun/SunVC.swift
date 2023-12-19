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
  
  private func setupUI() {
    
  }
  
  private func setupConstraints() {
    
  }
}
