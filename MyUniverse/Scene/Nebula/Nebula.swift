//
//  Nebula.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/12/23.
//

import Foundation
import UIKit

/// 성운
enum Nebula: String, CaseIterable {
  /// 오리온 대성운
  case oreon
  /// 런닝맨 성운
  case running
  /// 말머리 성운
  case horseHead
  
  var name: String {
    switch self {
    case .oreon:
      return "오리온 대성운"
      
    case .running:
      return "런닝맨 성운"
      
    case .horseHead:
      return "말머리 성운"
    }
  }
  
  var kind: String {
    switch self {
    case .oreon:
      return "방출/발광 성운"

    case .running:
      return "반사 성운"
      
    case .horseHead:
      return "암흑 성운"
    }
  }
  
  var description: String {
    switch self {
    case .oreon:
      return "이온화된 기체가 다양한 색깔을 내는 성간구름이다.\n성간 물질이 주변의 별빛을 흡수해 가열되면서 스스로 빛을 내는 성운으로, 주로 붉은색을 띈다."
      
    case .running:
      return "성간 물질이 주위의 별빛을 반사하여 밝게 보이는 성운이다.\n파란색 빛이 산란이 더 잘 되기 때문에, 주로 파란색을 띈다.(지구의 하늘이 파란색인 것과 같은 원리)"
      
    case .horseHead:
      return "성간 물질이 뒤쪽에서 오는 별빛을 가로막아 어둡게 보이는 성운으로, 검은색을 띈다.\n성분은 질량이 적은 먼지나 가스 등으로 이루어져 있다."
    }
  }
  
  var image: UIImage? {
    switch self {
    case .oreon:
      return UIImage(resource: R.image.nebula.oreon_emission_nebula)
      
    case .running:
      return UIImage(resource: R.image.nebula.running_reflection_nebula)
      
    case .horseHead:
      return UIImage(resource: R.image.nebula.horsehead_dark_nebula)
    }
  }
}
