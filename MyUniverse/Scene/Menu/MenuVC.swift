import UIKit

import SnapKit

final class MenuVC: MyUniVC {
  private let tableView: UITableView = {
    let v = UITableView(frame: .zero, style: .insetGrouped)
    v.backgroundColor = .clear
    v.registerCell(type: MenuTableViewCell.self)
    return v
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    setupConstraints()
  }
  
  private func setupUI() {
    setNavigationBarTitle("메뉴")
    navi.navigationBar.prefersLargeTitles = true
    
    view.addSubview(tableView)
    
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  private func setupConstraints() {
    tableView.snp.makeConstraints {
      $0.top.bottom.equalTo(view.safeAreaInsets)
      $0.leading.trailing.equalToSuperview()
    }
  }
}

extension MenuVC: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return Universe.allData.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Universe.allData[section].stars.count
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return Universe.allData[section].name
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let data = Universe.allData[indexPath.section].stars[indexPath.row]
    let cell = tableView.dequeueCell(type: MenuTableViewCell.self, indexPath: indexPath)
    cell.updateUI(text: data.name)
    return cell
  }
}
