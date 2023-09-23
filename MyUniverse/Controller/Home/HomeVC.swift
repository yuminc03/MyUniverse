//
//  HomeViewController.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/12.
//

import UIKit

import ComposableArchitecture
import SnapKit

struct HomeCore: Reducer {
  struct State: Equatable {
    let universe = Universe.dummy
    
  }
  
  enum Action {
    
  }
  
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    return .none
  }
}

final class HomeVC: TCABaseVC<HomeCore> {
  private let tableView: UITableView = {
    let v = UITableView(frame: .zero, style: .grouped)
    v.backgroundColor = .clear
    v.separatorStyle = .none
    v.registerHeaderFooter(type: HomeTableViewHeaderView.self)
    v.registerCell(type: HomeTableViewCell.self)
    return v
  }()
  
  init() {
    let store = Store(initialState: HomeCore.State()) {
      HomeCore()
    }
    super.init(store: store)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraints()
  }
  
  override func setupUI() {
    super.setupUI()
    view.backgroundColor = myUniColor(.mainColor)
    view.addSubview(tableView)
    let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
    footer.backgroundColor = .clear
    tableView.tableFooterView = footer
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  private func setupConstraints() {
    tableView.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
    }
  }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return viewStore.universe.universe.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = tableView.dequeueHeaderFooter(type: HomeTableViewHeaderView.self)
    header.updateUI(titleText: viewStore.universe.universe[section].name)
    return header
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueCell(type: HomeTableViewCell.self, indexPath: indexPath)
    cell.updateUI(collectionViewDelegate: self, collectionViewDataSource: self)
    return cell
  }
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return nil
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 0
  }
}

extension HomeVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewStore.universe.universe[section].stars.count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let item = collectionView.dequeueItem(type: HomeCollectionViewCell.self, indexPath: indexPath)
    item.backgroundColor = myUniColor(.subColor)
    item.setUI(
      titleText: viewStore.universe.universe[indexPath.section].stars[indexPath.row].name
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
