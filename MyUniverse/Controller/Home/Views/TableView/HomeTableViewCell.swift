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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Do not use Storyboard.")
    }
    
    func updateUI(
        collectionViewDelegate: UICollectionViewDelegateFlowLayout?,
        collectionViewDataSource: UICollectionViewDataSource?
    ) {
        collectionView.delegate = collectionViewDelegate
        collectionView.dataSource = collectionViewDataSource
    }
    
    private func setupUI() {
        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
            make.height.equalTo((UIScreen.main.bounds.width - 50) / 2)
        }
    }
}
