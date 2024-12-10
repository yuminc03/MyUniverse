import UIKit

import FlexLayout
import PinLayout

/// 행성 CollectionView Cell
final class PlanetCollectionViewCell: UICollectionViewCell {
  private let imageView = UIImageView()
  
  private let titleLabel: UILabel = {
    let v = UILabel()
    v.textColor = .white
    v.font = .systemFont(ofSize: 20, weight: .semibold)
    return v
  }()
  
  private let descriptionLabel: UILabel = {
    let v = UILabel()
    v.textColor = .white
    v.font = .systemFont(ofSize: 16, weight: .medium)
    v.numberOfLines = 0
    return v
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
    setupConstraints()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    contentView.flex.layout(mode: .adjustHeight)
  }
  
  override func sizeThatFits(_ size: CGSize) -> CGSize {
    contentView.flex.width(size.width)
    contentView.flex.layout(mode: .adjustHeight)
    return contentView.frame.size
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    setNeedsDisplay()
  }
  
  required init?(coder: NSCoder) {
    fatalError("Do not use Storyboard.")
  }
  
  private func setupUI() {
    backgroundColor = .clear
  }
  
  private func setupConstraints() {
    contentView.flex.direction(.column).define {
      $0.addItem().define {
        $0.addItem(imageView).aspectRatio(1.0)
      }
      $0.addItem().direction(.column).define {
        $0.addItem(titleLabel).marginTop(10)
        $0.addItem(descriptionLabel).marginTop(5)
      }
    }
  }
  
  func updateUI(planet: Planet) {
    titleLabel.text = planet.name
    descriptionLabel.text = planet.description
  }
  
  func updateImage(index: Int) {
    imageView.image = Planets.allCases[index].image
  }
}
