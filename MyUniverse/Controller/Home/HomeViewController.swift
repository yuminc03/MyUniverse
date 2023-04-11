//
//  HomeViewController.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/12.
//

import UIKit
import SnapKit

final class HomeViewController: MyUniViewController {
    
    private let viewModel = HomeViewModel()
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
    func getViewModel() -> HomeViewModel {
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
