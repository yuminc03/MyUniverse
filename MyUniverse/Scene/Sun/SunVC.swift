//
//  SunVC.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/12/19.
//

import UIKit

import ComposableArchitecture
import FlexLayout
import PinLayout

struct SunCore: Reducer {
  struct State: Equatable {
    
  }
  
  enum Action {
    
  }
  
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    return .none
  }
}

final class SunVC: TCABaseVC<SunCore> {
  
  private let containerView: UIView = {
    let v = UIView()
    v.backgroundColor = .clear
    return v
  }()
  
  private let scrollView: UIScrollView = {
    let v = UIScrollView()
    v.backgroundColor = .clear
    return v
  }()
  
  private let imageView: UIImageView = {
    let v = UIImageView()
    v.image = UIImage(resource: R.image.solar.sun)
    v.contentMode = .scaleAspectFit
    return v
  }()
  
  private let titleLabel: UILabel = {
    let v = UILabel()
    v.text = "태양계에서 유일하게 스스로 빛을 내는 천체로, 지구와 가장 가까운 별."
    v.textColor = UIColor(resource: R.color.purple100)
    v.font = .systemFont(ofSize: 20, weight: .semibold)
    v.numberOfLines = 0
    return v
  }()
  
  private let descriptionLabel: UILabel = {
    let v = UILabel()
    v.text = "태양의 표면\n쌀알무늬: 광구에 나타나는 작고 밝은 쌀알 모양의 무늬이다. 내부의 대류현상에 의해 나타난다.\n흑점: 광구에 나타나는 검은 점, 주위보다 온도가 약 2000℃ 낮아 어둡게 보인다.\n태양의 대기 - 평소에는 관측이 어렵고 개기 일식 때 잘 관측된다.\n채층 - 광구 바로 위의 붉은 색을 띤 얇은 대기층이다.\n코로나 - 채층 위로 멀리까지 뻗어있는 대기층으로 온도가 100만 ℃ 이상이다.\n홍염 - 채층 위로 수십만 km까지 솟아오르는 거대한 불기둥이다.\n플레어 - 흑점 부근의 폭발로 많은 양의 에너지가 방출되는 현상이다."
    v.textColor = UIColor(resource: R.color.purple100)
    v.font = .systemFont(ofSize: 16, weight: .medium)
    v.numberOfLines = 0
    return v
  }()
  
  init() {
    super.init(store: Store(initialState: SunCore.State()) {
      SunCore()
    })
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraints()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    scrollView.pin.all()
    containerView.pin.top().left().right()
    containerView.flex.layout(mode: .adjustHeight)
    scrollView.contentSize = containerView.frame.size
  }
  
  private func setupUI() {
    setNavigationBarTitle("태양☀️")
    view.backgroundColor = UIColor(resource: R.color.bgColor)
    view.addSubview(scrollView)
    scrollView.addSubview(containerView)
  }
  
  private func setupConstraints() {
    containerView.flex.define {
      $0.addItem().direction(.column).alignItems(.center).padding(20).define {
        $0.addItem(imageView).width(UIScreen.main.bounds.width - 80).aspectRatio(1.0)
        $0.addItem(titleLabel).marginTop(20)
        $0.addItem(descriptionLabel).marginTop(10)
      }
    }
  }
}
