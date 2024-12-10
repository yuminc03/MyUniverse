import UIKit

import ComposableArchitecture
import FlexLayout
import PinLayout

struct NebulaCore: Reducer {
  struct State: Equatable {
    
  }
  
  enum Action {
    
  }
  
  var body: some ReducerOf<Self> {
    EmptyReducer()
  }
}

final class NebulaVC: TCABaseVC<NebulaCore> {
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
    v.registerItem(type: NebulaCollectionViewCell.self)
    return v
  }()
  
  init() {
    super.init(store: .init(initialState: NebulaCore.State()) {
      NebulaCore()
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
    setNavigationBarTitle("성운☁️")
    view.backgroundColor = UIColor(resource: R.color.bgColor)
    view.addSubview(containerView)
    containerView.addSubview(collectionView)
    collectionView.delegate = self
    collectionView.dataSource = self
  }
}

extension NebulaVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return NebulaModel.dummy.count + 1
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    if indexPath.item == 0 {
      let item = collectionView.dequeueItem(type: NebulaDescriptionCollectionViewCell.self, indexPath: indexPath)
      item.updateUI(
        title: "별과 별 사이에 성간 물질이 많이 모여 있어 구름처럼 보이는 것.",
        description: "성간구름 - 우리 은하계 내나 은하계외 성운에서 볼 수 있는 가스·플라스마·우주진의 모임\n성간 물질 - 은하 내의 항성 사이나 항성 바로 근처에 존재하는 물질이나 에너지"
      )
      return item
    } else {
      let item = collectionView.dequeueItem(type: NebulaCollectionViewCell.self, indexPath: indexPath)
      item.updateUI(data: NebulaModel.dummy[indexPath.item - 1])
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
        title: "별과 별 사이에 성간 물질이 많이 모여 있어 구름처럼 보이는 것.",
        description: "성간구름 - 우리 은하계 내나 은하계외 성운에서 볼 수 있는 가스·플라스마·우주진의 모임\n성간 물질 - 은하 내의 항성 사이나 항성 바로 근처에 존재하는 물질이나 에너지"
      )
      return item.sizeThatFits(
        CGSize(width: UIScreen.main.bounds.width - 40, height: .greatestFiniteMagnitude)
      )
    } else {
      let item = collectionView.dequeueItem(type: NebulaCollectionViewCell.self, indexPath: indexPath)
      item.updateUI(data: NebulaModel.dummy[indexPath.item - 1])
      item.updateImage(index: indexPath.item - 1)
      return item.sizeThatFits(
        CGSize(width: UIScreen.main.bounds.width - 40, height: .greatestFiniteMagnitude)
      )
    }
  }
}
