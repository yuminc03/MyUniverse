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
    let planets = Planet.dummy
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
  
  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 10
    layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    layout.scrollDirection = .vertical
    let v = UICollectionView(frame: .zero, collectionViewLayout: layout)
    v.backgroundColor = .clear
    v.registerItem(type: PlanetCollectionViewCell.self)
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
    collectionView.pin.all()
  }
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    collectionView.collectionViewLayout.invalidateLayout()
  }
  
  private func setupUI() {
    setNavigationBarTitle("행성🪐")
    view.backgroundColor = UIColor(resource: R.color.bgColor)
    view.addSubview(containerView)
    containerView.addSubview(collectionView)
    collectionView.delegate = self
    collectionView.dataSource = self
  }
}

// MARK: - UICollectionViewDelegateFlowLayout & UICollectionViewDataSource

extension PlanetsVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewStore.planets.count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let item = collectionView.dequeueItem(type: PlanetCollectionViewCell.self, indexPath: indexPath)
    item.updateUI(planet: viewStore.planets[indexPath.item])
    item.updateImage(index: indexPath.item)
    return item
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    let item = PlanetCollectionViewCell()
    item.updateUI(planet: viewStore.planets[indexPath.item])
    item.updateImage(index: indexPath.item)
    return item.sizeThatFits(
      CGSize(width: (UIScreen.main.bounds.width - 60) / 2, height: .greatestFiniteMagnitude)
    )
  }
  
}
