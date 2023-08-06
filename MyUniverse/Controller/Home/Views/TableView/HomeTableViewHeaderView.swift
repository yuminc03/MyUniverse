//
//  HomeTableHeaderView.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/19.
//

import UIKit
import SnapKit

final class HomeTableViewHeaderView: UITableViewHeaderFooterView {
    
    private let titleLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUI(titleText: String) {
        titleLabel.text = titleText
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 20, weight: .medium)
        contentView.addSubview(titleLabel)
    }
    
    private func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}
