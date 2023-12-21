//
//  AsteroidVC.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/12/21.
//

import UIKit

import ComposableArchitecture
import FlexLayout
import PinLayout

struct AsteroidCore: Reducer {
  struct State: Equatable {
    
  }
  
  enum Action {
    
  }
  
  var body: some ReducerOf<Self> {
    EmptyReducer()
  }
}

final class AsteroidVC: TCABaseVC<AsteroidCore> {
  
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
    v.image = UIImage(resource: R.image.asteroid)
    v.contentMode = .scaleAspectFit
    return v
  }()
  
  private let titleLabel: UILabel = {
    let v = UILabel()
    v.text = "태양 주위를 공전하는 행성보다 크기가 작고 타원형 또는 불규칙한 모양의 천체이다."
    v.textColor = UIColor(resource: R.color.purple100)
    v.font = .systemFont(ofSize: 20, weight: .semibold)
    v.numberOfLines = 0
    return v
  }()
  
  private let descriptionLabel: UILabel = {
    let v = UILabel()
    v.text = "주로 화성과 목성의 궤도 사이에 띠를 이루며 집중적으로 분포한다.(소행성대)\n처음으로 발견된 소행성은 세레스이며 일부 소행성은 자신의 위성을 가지고 있다. 가스로 된 코마나 꼬리를 가지지 않는다는 점에서 혜성과 구분되지만, 일부 소행성은 과거에 혜성이었다.\n그래서 목성 궤도 밖의 천체를 포함해 소행성체로 구분한다."
    v.textColor = UIColor(resource: R.color.purple100)
    v.font = .systemFont(ofSize: 16, weight: .medium)
    v.numberOfLines = 0
    return v
  }()
  
  init() {
    super.init(store: .init(initialState: AsteroidCore.State()) {
      AsteroidCore()
    })
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    scrollView.pin.all()
    containerView.pin.top().left().right()
    containerView.flex.layout(mode: .adjustHeight)
    scrollView.contentSize = containerView.frame.size
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraints()
  }
  
  private func setupUI() {
    setNavigationBarTitle("소행성🪨")
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
