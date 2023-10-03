//
//  BirthConstellationVC.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/10/03.
//

import UIKit

import FlexLayout
import PinLayout

/// 탄생 별자리
final class BirthConstellationVC: MyUniVC {
  private let containerView: UIView = {
    let v = UIView()
    v.backgroundColor = .clear
    return v
  }()
  
  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(
      width: (UIScreen.main.bounds.width - 50) / 2,
      height: (UIScreen.main.bounds.width - 20) / 2
    )
    layout.minimumLineSpacing = 10
    layout.scrollDirection = .vertical
    let v = UICollectionView(frame: .zero, collectionViewLayout: layout)
    v.backgroundColor = .clear
    v.registerItem(type: BirthConstellationCollectionCell.self)
    return v
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstriants()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    containerView.pin.layout()
    collectionView.pin.layout()
  }
  
  private func setupUI() {
    view.backgroundColor = myUniColor(.mainColor)
    view.addSubview(containerView)
    containerView.addSubview(collectionView)
    collectionView.delegate = self
    collectionView.dataSource = self
  }
  
  private func setupConstriants() {
//    containerView.flex.define {
//      $0.addItem(collectionView)
//    }
  }
}

extension BirthConstellationVC: UICollectionViewDelegate, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return BirthConstellation.dummy.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let item = collectionView.dequeueItem(type: BirthConstellationCollectionCell.self, indexPath: indexPath)
    item.updateUI(constellation: BirthConstellation.dummy[indexPath.item])
    return item
  }
}
