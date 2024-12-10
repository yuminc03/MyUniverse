import UIKit

import SnapKit

final class CustomItemView: UIView {
    
    private let titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white.withAlphaComponent(0.4)
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 11, weight: .semibold)
        return view
    }()
    
    private let iconImageView = UIImageView()
    private let containerView = UIView()
    private let item: CustomTabBarItem
    let clearButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .clear
        return view
    }()
    
    let index: Int
    var isSelected: Bool = false {
        didSet {
            animateItem()
        }
    }
    
    init(with item: CustomTabBarItem, index: Int) {
        self.item = item
        self.index = index
        super.init(frame: .zero)
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Do not use Storyboard.")
    }
    
    private func setupUI() {
        addSubview(containerView)
        containerView.addSubviews([iconImageView, titleLabel, clearButton])
        
        iconImageView.image = isSelected ? item.selectedIcon : item.icon
        titleLabel.text = item.title
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.center.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalTo(titleLabel.snp.top)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(16)
        }
        
        clearButton.snp.makeConstraints {
            $0.width.height.equalTo(40)
            $0.center.equalTo(iconImageView)
        }
    }
    
    private func animateItem() {
        UIView.transition(with: iconImageView, duration: 0.4, options: .transitionCrossDissolve) {
            self.iconImageView.image = self.isSelected ? self.item.selectedIcon : self.item.icon
        }
    }
}
