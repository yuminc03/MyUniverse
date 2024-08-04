import UIKit

import SnapKit

final class MenuTableViewCell: UITableViewCell {
  private let containerStackView: UIStackView = {
    let v = UIStackView()
    v.axis = .horizontal
    v.spacing = 20
    return v
  }()
  
  private let titleLabel: UILabel = {
    let v = UILabel()
    v.textColor = UIColor(resource: R.color.purple200)
    v.font = .systemFont(ofSize: 14)
    return v
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupUI()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("Do not use Storyboard.")
  }
  
  func updateUI(text: String) {
    titleLabel.text = text
  }
  
  private func setupUI() {
    selectionStyle = .none
    backgroundColor = .white
    addSubview(containerStackView)
    
    containerStackView.addArrangedSubviews([titleLabel])
  }
  
  private func setupConstraints() {
    containerStackView.snp.makeConstraints {
      $0.top.bottom.equalToSuperview().inset(10)
      $0.leading.trailing.equalToSuperview().inset(20)
    }
  }
}
