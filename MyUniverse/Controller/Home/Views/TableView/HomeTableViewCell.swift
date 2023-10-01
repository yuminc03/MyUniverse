//
//  HomeTableViewCell.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/16.
//

import UIKit

import SnapKit

/// HomeViewController의 TableView를 구성하는 Cell
final class HomeTableViewCell: UITableViewCell {
  private var collectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.minimumLineSpacing = 10
    flowLayout.minimumInteritemSpacing = 0
    flowLayout.scrollDirection = .horizontal
    flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    collectionView.backgroundColor = .clear
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.registerItem(type: HomeCollectionViewCell.self)
    return collectionView
  }()
  
  private let constellation = Universe.constellationDummy
  private let solarSystem = Universe.solarSystemDummy
  private let interstellarMaterial = Universe.interstellarMaterialDummy
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("Do not use Storyboard.")
  }
  
  func updateUI(
    tag: Int
  ) {
    collectionView.tag = tag
  }
  
  private func setupUI() {
    backgroundColor = .clear
    selectionStyle = .none
    contentView.addSubview(collectionView)
    collectionView.delegate = self
    collectionView.dataSource = self
  }
  
  private func setupConstraints() {
    collectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
      $0.height.equalTo((UIScreen.main.bounds.width - 50) / 2 + 10)
    }
  }
}

extension HomeTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch collectionView.tag {
    case 0:
      return constellation.stars.count
      
    case 1:
      return solarSystem.stars.count
      
    case 2:
      return interstellarMaterial.stars.count
      
    default:
      return 0
    }
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let item = collectionView.dequeueItem(type: HomeCollectionViewCell.self, indexPath: indexPath)
    item.backgroundColor = myUniColor(.subColor)
    switch collectionView.tag {
    case 0:
      item.setUI(
        titleText: constellation.stars[indexPath.item].name
      )
      
    case 1:
      item.setUI(
        titleText: solarSystem.stars[indexPath.item].name
      )
      
    case 2:
      item.setUI(
        titleText: interstellarMaterial.stars[indexPath.item].name
      )
      
    default: break
    }
    
    return item
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    return CGSize(
      width: (UIScreen.main.bounds.width - 50) / 2,
      height: (UIScreen.main.bounds.width - 50) / 2
    )
  }
}
