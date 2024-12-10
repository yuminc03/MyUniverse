import Foundation
import UIKit

enum Galaxy: String, CaseIterable {
  /// 타원 은하
  case ellipse
  /// 정상 나선 은하
  case barredSpiral
  /// 막대 나선 은하
  case barSpiral
  /// 불규칙 은하
  case irregular
  
  var name: String {
    switch self {
    case .ellipse:
      return "타원 은하"
      
    case .barredSpiral:
      return "정상 나선 은하"
      
    case .barSpiral:
      return "막대 나선 은하"
      
    case .irregular:
      return "불규칙 은하"
    }
  }
  
  var description: String {
    switch self {
    case .ellipse:
      return "나선팔이 없고 구형에 가깝거나 타원모양이다.\n모양은 거의 둥근 것부터 크게 평탄한 것까지 다양하고, 크기는 수천만 개의 별로 구성된 것부터 1조 개의 별로 구성된 것까지 있다."
      
    case .barredSpiral:
      return "은하 중심에서 바로 나선팔이 휘어져 나온 모양이다. 막대나선은하가 아닌 유형의 나선은하이다."
      
    case .barSpiral:
      return "은하 중심을 가로지르는 막대 모양의 끝에서 나선팔이 휘어져 나온 모양이다.\n막대는 모든 나선은하의 약 3분의 2에서 발견된다."
      
    case .irregular:
      return "비대칭적이거나 불규칙한 모양이다.\n나선은하나 타원은하와 달리 뚜렷한 특정 모양을 가지지 않는 은하이다. 일부 불규칙은하는 한때 나선은하나 타원은하였지만 중력을 통한 장애로 인해 변형된 것이다."
    }
  }
  
  var image: UIImage? {
    switch self {
    case .ellipse:
      return UIImage(resource: R.image.galaxy.elliptical_galaxy)
      
    case .barredSpiral:
      return UIImage(resource: R.image.galaxy.normal_spiral_galaxy)
      
    case .barSpiral:
      return UIImage(resource: R.image.galaxy.barred_spiral_galaxy)
      
    case .irregular:
      return UIImage(resource: R.image.galaxy.irregular_galaxy)
    }
  }
}
