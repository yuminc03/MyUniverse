import UIKit

import ComposableArchitecture
import PinLayout
import FlexLayout

struct SeasonConstellationCore: Reducer {
  struct State: Equatable {
    
  }
  
  enum Action {
    
  }
  
  var body: some ReducerOf<Self> {
    EmptyReducer()
  }
}

final class SeasonConstellationVC: TCABaseVC<SeasonConstellationCore> {
  private let containerView: UIView = {
    let v = UIView()
    v.backgroundColor = .clear
    return v
  }()
  
  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 10
    layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    layout.scrollDirection = .vertical
    let v = UICollectionView(frame: .zero, collectionViewLayout: layout)
    v.backgroundColor = .clear
    v.registerItem(type: SeasonConstellationCollectionCell.self)
    return v
  }()
  
  init() {
    let store = Store(initialState: SeasonConstellationCore.State()) {
      SeasonConstellationCore()
    }
    super.init(store: store)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    containerView.pin.all()
    collectionView.pin.all()
  }
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    collectionView.collectionViewLayout.invalidateLayout()
  }
  
  private func setupUI() {
    setNavigationBarTitle("계절별 별자리")
    view.addSubview(containerView)
    view.backgroundColor = UIColor(resource: R.color.bgColor)
    containerView.addSubview(collectionView)
    collectionView.delegate = self
    collectionView.dataSource = self
  }
}

extension SeasonConstellationVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return SeasonConstellation.dummy.count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let item = collectionView.dequeueItem(type: SeasonConstellationCollectionCell.self, indexPath: indexPath)
    item.updateUI(data: SeasonConstellation.dummy[indexPath.item])
    item.updateImage(index: indexPath.item)
    return item
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    let item = SeasonConstellationCollectionCell()
    item.updateUI(data: SeasonConstellation.dummy[indexPath.item])
    item.updateImage(index: indexPath.item)
    return item.sizeThatFits(
      CGSize(width: UIScreen.main.bounds.width - 40, height: .greatestFiniteMagnitude)
    )
  }
}
