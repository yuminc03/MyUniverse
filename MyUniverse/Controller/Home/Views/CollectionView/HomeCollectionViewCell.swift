//
//  HomeCollectionViewCell.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/19.
//

import UIKit
import SnapKit

final class HomeCollectionViewCell: UICollectionViewCell {
    
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUI(titleText: String) {
        titleLabel.text = titleText
        setupView()
        setConstriants()
    }
    
    private func setupView() {
        layer.cornerRadius = 10
        
        titleLabel.textColor = UIColor(named: "purple_B080FF")
        titleLabel.font = .systemFont(ofSize: 16)
        contentView.addSubview(titleLabel)
    }
    
    private func setConstriants() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.lessThanOrEqualToSuperview().offset(-20)
            make.top.equalToSuperview().offset(20)
        }
    }
}
