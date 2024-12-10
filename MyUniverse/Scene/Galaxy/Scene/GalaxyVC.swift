import UIKit

import ComposableArchitecture
import FlexLayout
import PinLayout

struct GalaxyCore: Reducer {
  struct State: Equatable {
    
  }
  
  enum Action {
    
  }
  
  var body: some ReducerOf<Self> {
    EmptyReducer()
  }
}

final class GalaxyVC: TCABaseVC<GalaxyCore> {
  
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
    v.registerItem(type: NebulaDescriptionCollectionViewCell.self)
    v.registerItem(type: GalaxyCollectionViewCell.self)
    return v
  }()
  
  init() {
    super.init(store: .init(initialState: GalaxyCore.State()) {
      GalaxyCore()
    })
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
    setNavigationBarTitle("은하🌌")
    view.backgroundColor = UIColor(resource: R.color.bgColor)
    view.addSubview(containerView)
    containerView.addSubview(collectionView)
    collectionView.delegate = self
    collectionView.dataSource = self
  }
}

extension GalaxyVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return Galaxy.allCases.count + 1
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    if indexPath.item == 0 {
      let item = collectionView.dequeueItem(type: NebulaDescriptionCollectionViewCell.self, indexPath: indexPath)
      item.updateUI(
        title: "항성, 밀집성, 성간 물질, 암흑 물질 등이 중력에 의해 뭉친 거대한 천체.",
        description: "항성 - 별의 천문학적인 표현\n밀집성 - 별 내부 물질의 밀도가 보통의 별보다 압도적으로 큰 별\n성간물질 - 별과 별 사이(일반적인 우주 공간)에 있는 물질들의 총칭\n암흑물질 - 전자기파를 비롯한 다른 수단으로는 전혀 관측되지 않는 수수께끼의 물질이다."
      )
      return item
    } else {
      let item = collectionView.dequeueItem(type: GalaxyCollectionViewCell.self, indexPath: indexPath)
      item.updateUI(data: GalaxyModel.dummy[indexPath.item - 1])
      item.updateImage(index: indexPath.item - 1)
      return item
    }
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    if indexPath.item == 0 {
      let item = NebulaDescriptionCollectionViewCell()
      item.updateUI(
        title: "항성, 밀집성, 성간 물질, 암흑 물질 등이 중력에 의해 뭉친 거대한 천체.",
        description: "항성 - 별의 천문학적인 표현\n밀집성 - 별 내부 물질의 밀도가 보통의 별보다 압도적으로 큰 별\n성간물질 - 별과 별 사이(일반적인 우주 공간)에 있는 물질들의 총칭\n암흑물질 - 전자기파를 비롯한 다른 수단으로는 전혀 관측되지 않는 수수께끼의 물질이다."
      )
      return item.sizeThatFits(
        CGSize(width: UIScreen.main.bounds.width - 40, height: .greatestFiniteMagnitude)
      )
    } else {
      let item = collectionView.dequeueItem(type: GalaxyCollectionViewCell.self, indexPath: indexPath)
      item.updateUI(data: GalaxyModel.dummy[indexPath.item - 1])
      item.updateImage(index: indexPath.item - 1)
      return item.sizeThatFits(
        CGSize(width: UIScreen.main.bounds.width - 40, height: .greatestFiniteMagnitude)
      )
    }
  }
}
