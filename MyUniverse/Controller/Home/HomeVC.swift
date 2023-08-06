//
//  HomeViewController.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/12.
//

import UIKit
import SnapKit

final class HomeVC: MyUniVC {
    
    let vm = HomeVM()
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerHeaderFooter(type: HomeTableViewHeaderView.self)
        tableView.registerCell(type: HomeTableViewCell.self)
        view.addSubview(tableView)
    }
    
    private func setConstraints() {
        tableView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        vm.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueHeaderFooter(type: HomeTableViewHeaderView.self)
        header.backgroundColor = .clear
        header.setUI(titleText: vm.getHomeTableHeaderTitles()[section])
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(type: HomeTableViewCell.self, indexPath: indexPath)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.setUI(parentViewWidth: view.frame.width, collectionViewDelegate: self, collectionViewDataSource: self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.getCollectionNumberOfItemsInSection(section: section)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let item = collectionView.dequeueItem(type: HomeCollectionViewCell.self, indexPath: indexPath)
        item.backgroundColor = UIColor(named: "subColor")
        item.setUI(
            titleText: vm.getCollectionViewCellTitles(
                section: vm.numberOfRowsInSection(),
                item: indexPath.item
            )
        )
        return item
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: (view.frame.width - 50) / 2, height: (view.frame.width - 50) / 2)
    }
}
