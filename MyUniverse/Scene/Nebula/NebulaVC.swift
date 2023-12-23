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
    view.addSubview(containerView)
    containerView.addSubview(collectionView)
    collectionView.delegate = self
    collectionView.dataSource = self
  }
  
  private func setupConstraints() {
    
  }
}

extension NebulaVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return 1
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    return UICollectionViewCell()
//    let item = collectionView.dequeueItem(type: SeasonConstellationCollectionCell.self, indexPath: indexPath)
//    item.updateUI(data: SeasonConstellation.dummy[indexPath.item])
//    item.updateImage(index: indexPath.item)
//    return item
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    let item = SeasonConstellationCollectionCell()
    item.updateUI(data: SeasonConstellation.dummy[indexPath.item])
    item.updateImage(index: indexPath.item)
    return item.sizeThatFits(
      CGSize(width: UIScreen.main.bounds.width - 40, height: .greatestFiniteMagnitude)
    )
  }
}
