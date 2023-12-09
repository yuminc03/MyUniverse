//
//  SeasonConstellationVC.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/12/09.
//

import UIKit

import ComposableArchitecture
import PinLayout
import FlexLayout
import DesignSystem

struct SeasonConstellationCore: Reducer {
  struct State: Equatable {
    
  }
  
  enum Action {
    
  }
  
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    return .none
  }
}

final class SeasonConstellationVC: TCABaseVC<SeasonConstellationCore> {
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
    v.registerItem(type: BirthConstellationCollectionCell.self)
    return v
  }()
  
  init() {
    let store = Store(initialState: SeasonConstellationCore.State()) {
      SeasonConstellationCore()
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
    collectionView.pin.all()
  }
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    collectionView.collectionViewLayout.invalidateLayout()
  }
  
  private func setupUI() {
    setNavigationBarTitle("계절별 별자리")
    view.addSubview(containerView)
    view.backgroundColor = DesignSystem.myUniColor(.BGColor)
    containerView.addSubview(collectionView)
    collectionView.delegate = self
    collectionView.dataSource = self
  }
}

extension SeasonConstellationVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return BirthConstellation.dummy.count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let item = collectionView.dequeueItem(type: BirthConstellationCollectionCell.self, indexPath: indexPath)
    item.updateUI(constellation: BirthConstellation.dummy[indexPath.item])
    return item
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    let vc = BirthConstellationDetailVC(constellation: viewStore.constellations[indexPath.row])
//    navi.pushViewController(vc, animated: true)
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    let item = BirthConstellationCollectionCell()
    item.updateUI(constellation: BirthConstellation.dummy[indexPath.item])
    return item.sizeThatFits(
      CGSize(width: (UIScreen.main.bounds.width - 60) / 2, height: .greatestFiniteMagnitude)
    )
  }
}
