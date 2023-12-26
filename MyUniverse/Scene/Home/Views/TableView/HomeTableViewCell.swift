//
//  HomeTableViewCell.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/16.
//

import UIKit

import FlexLayout
import PinLayout

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
    collectionView.registerItem(type: SolarSystemCollectionCell.self)
    collectionView.registerItem(type: ConstellationCollectionCell.self)
    return collectionView
  }()
  
  private let constellation = Universe.constellationDummy
  private let solarSystem = Universe.solarSystemDummy
  private let interstellarMaterial = Universe.interstellarMaterialDummy
  private var didSelectAction: ((Int, Int) -> Void)?
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
    setupConstraints()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    contentView.flex.layout(mode: .adjustHeight)
  }
  
  override func sizeThatFits(_ size: CGSize) -> CGSize {
    super.sizeThatFits(size)
    contentView.flex.width(size.width)
    contentView.flex.layout(mode: .adjustHeight)
    return contentView.frame.size
  }
  
  required init?(coder: NSCoder) {
    fatalError("Do not use Storyboard.")
  }
  
  private func setupUI() {
    backgroundColor = .clear
    selectionStyle = .none
    contentView.addSubview(collectionView)
    collectionView.delegate = self
    collectionView.dataSource = self
  }
  
  private func setupConstraints() {
    contentView.flex.define {
      switch collectionView.tag {
      case 0:
        $0.addItem(collectionView).height(UIScreen.main.bounds.width - 170)
        
      case 1:
        $0.addItem(collectionView).height((UIScreen.main.bounds.width - 50) / 2 + 10)
        
      case 2:
        $0.addItem(collectionView).height((UIScreen.main.bounds.width - 50) / 2 + 10)
        
      default: break
      }
    }
  }
  
  func updateUI(tag: Int) {
    collectionView.tag = tag
  }
  
  func didSelectItem(_ action: @escaping (Int, Int) -> Void) {
    self.didSelectAction = action
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
    switch collectionView.tag {
    case 0:
      let item = collectionView.dequeueItem(
        type: ConstellationCollectionCell.self,
        indexPath: indexPath
      )
      item.updateUI(star: constellation.stars[indexPath.item])
      return item
      
    case 1:
      let item = collectionView.dequeueItem(
        type: SolarSystemCollectionCell.self,
        indexPath: indexPath
      )
      item.setUI(titleText: solarSystem.stars[indexPath.item].name)
      return item
      
    case 2:
      let item = collectionView.dequeueItem(
        type: SolarSystemCollectionCell.self,
        indexPath: indexPath
      )
      item.setUI(titleText: interstellarMaterial.stars[indexPath.item].name)
      return item

    default: return UICollectionViewCell()
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    didSelectAction?(collectionView.tag, indexPath.item)
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    switch collectionView.tag {
    case 0:
      return CGSize(
        width: UIScreen.main.bounds.width - 40,
        height: UIScreen.main.bounds.width - 180
      )
      
    case 1, 2:
      return CGSize(
        width: (UIScreen.main.bounds.width - 50) / 2,
        height: (UIScreen.main.bounds.width - 30) / 2
      )
      
    default: return CGSize(width: 0, height: 0)
    }
  }
}
