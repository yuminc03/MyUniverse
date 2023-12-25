//
//  GalaxyVC.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/12/25.
//

import UIKit

import ComposableArchitecture
import FlexLayout
import PinLayout

struct GalaxyCore: Reducer {
  struct State: Equatable {
    
  }
  
  enum Action {
    
  }
  
  var body: some ReducerOf<Self> {
    EmptyReducer()
  }
}

final class GalaxyVC: TCABaseVC<GalaxyCore> {
  
  private let containerView: UIView = {
    let v = UIView()
    v.backgroundColor = .clear
    return v
  }()
  
  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 10
    layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    layout.scrollDirection = .vertical
    let v = UICollectionView(frame: .zero, collectionViewLayout: layout)
    v.backgroundColor = .clear
    v.registerItem(type: NebulaDescriptionCollectionViewCell.self)
    v.registerItem(type: NebulaCollectionViewCell.self)
    return v
  }()
  
  init() {
    super.init(store: .init(initialState: GalaxyCore.State()) {
      GalaxyCore()
    })
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraints()
  }
  
  private func setupUI() {
    setNavigationBarTitle("은하🌌")
    view.backgroundColor = UIColor(resource: R.color.bgColor)
  }
  
  private func setupConstraints() {
    
  }
}
