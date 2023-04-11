//
//  HomeTableViewCell.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/16.
//

import UIKit
import SnapKit

///HomeViewController의 TableView를 구성하는 Cell
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
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "main_collection_cell")
        return collectionView
    }()
    private var parentViewWidth: CGFloat = 0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUI(parentViewWidth: CGFloat, collectionViewDelegate: UICollectionViewDelegateFlowLayout?, collectionViewDataSource: UICollectionViewDataSource?) {
        self.parentViewWidth = parentViewWidth
        collectionView.delegate = collectionViewDelegate
        collectionView.dataSource = collectionViewDataSource
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        contentView.addSubview(collectionView)
    }
    
    private func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
            make.height.equalTo((parentViewWidth - 50) / 2)
        }
    }
}
