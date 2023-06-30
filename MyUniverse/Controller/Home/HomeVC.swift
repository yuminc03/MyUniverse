//
//  HomeViewController.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/12.
//

import UIKit
import SnapKit

final class HomeVC: MyUniVC {
    
    private let viewModel = HomeVM()
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
    func getViewModel() -> HomeVM {
        return viewModel
    }
    
    private func setupView() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "main_header")
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "main_cell")
        view.addSubview(tableView)
    }
    
    private func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        getViewModel().numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        getViewModel().numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "main_header") as? HomeTableViewHeaderView else { return UIView() }
        header.backgroundColor = .clear
        header.setUI(titleText: getViewModel().getHomeTableHeaderTitles()[section])
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "main_cell", for: indexPath) as? HomeTableViewCell,
                indexPath.row < getViewModel().numberOfRowsInSection() else {
            return UITableViewCell()
        }
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
        return getViewModel().getCollectionNumberOfItemsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: "main_collection_cell", for: indexPath) as? HomeCollectionViewCell,
              indexPath.item < getViewModel().getCollectionNumberOfItemsInSection(section: getViewModel().numberOfRowsInSection()) else {
            return UICollectionViewCell()
        }
        item.backgroundColor = UIColor(named: "subColor")
        item.setUI(titleText: getViewModel().getCollectionViewCellTitles(section: getViewModel().numberOfRowsInSection(), item: indexPath.item))
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 50) / 2, height: (view.frame.width - 50) / 2)
    }
}
