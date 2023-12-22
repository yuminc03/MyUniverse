//
//  NebulaVC.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/12/22.
//

import UIKit

import ComposableArchitecture

struct NebulaCore: Reducer {
  struct State: Equatable {
    
  }
  
  enum Action {
    
  }
  
  var body: some ReducerOf<Self> {
    EmptyReducer()
  }
}

final class NebulaVC: TCABaseVC<NebulaCore> {
  
  init() {
    super.init(store: .init(initialState: NebulaCore.State()) {
      NebulaCore()
    })
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraints()
  }
  
  private func setupUI() {
    setNavigationBarTitle("성운☁️")
    view.backgroundColor = UIColor(resource: R.color.bgColor)
    
  }
  
  private func setupConstraints() {
    
  }
}
