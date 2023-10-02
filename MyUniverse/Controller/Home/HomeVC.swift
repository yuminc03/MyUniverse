//
//  HomeViewController.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/12.
//

import UIKit

import ComposableArchitecture
import FlexLayout
import PinLayout

struct HomeCore: Reducer {
  struct State: Equatable {
    let constellation = Universe.constellationDummy
    let solarSystem = Universe.solarSystemDummy
    let interstellarMaterial = Universe.interstellarMaterialDummy
    
  }
  
  enum Action {
    
  }
  
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    return .none
  }
}

final class HomeVC: TCABaseVC<HomeCore> {
  private let containerView: UIView = {
    let v = UIView()
    v.backgroundColor = .clear
    return v
  }()
  
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
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    containerView.pin.all().margin(view.pin.safeArea)
    tableView.pin.all()
  }
  
  private func setupUI() {
    view.backgroundColor = myUniColor(.mainColor)
    view.addSubview(containerView)
    containerView.addSubview(tableView)
    let header = HomeTableHeaderView(
      frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 80)
    )
    let footer = UIView(
      frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100)
    )
    footer.backgroundColor = .clear
    tableView.tableHeaderView = header
    tableView.tableFooterView = footer
    tableView.delegate = self
    tableView.dataSource = self
  }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = tableView.dequeueHeaderFooter(type: HomeTableViewHeaderView.self)
    switch section {
    case 0:
      header.updateUI(titleText: viewStore.constellation.name)
      
    case 1:
      header.updateUI(titleText: viewStore.solarSystem.name)
      
    case 2:
      header.updateUI(titleText: viewStore.interstellarMaterial.name)

    default: break
    }
    
    return header
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueCell(type: HomeTableViewCell.self, indexPath: indexPath)
    cell.updateUI(tag: indexPath.section)
    return cell
  }
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return nil
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 0
  }
}
