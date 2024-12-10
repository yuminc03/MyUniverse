import Foundation
import UIKit

enum Planets: CaseIterable {
  case mercury
  case venus
  case earth
  case mars
  case jupiter
  case saturn
  case uranus
  case neptune
  
  var name: String {
    switch self {
    case .mercury:
      return "수성"
      
    case .venus:
      return "금성"
      
    case .earth:
      return "지구"
      
    case .mars:
      return "화성"
      
    case .jupiter:
      return "목성"
      
    case .saturn:
      return "토성"
      
    case .uranus:
      return "천왕성"
      
    case .neptune:
      return "해왕성"
    }
  }
  
  var description: String {
    switch self {
    case .mercury:
      return "그리스 신 헤르메스(Hermes)를 상징한다. 태양에 가장 가까운 행성이고 가장 작은 행성이다.\n대기가 없어 낮과 밤의 표면온도 차이가 매우 크다. 표면에 달과 같이 운석 구덩이가 많이 남아 있다."
      
    case .venus:
      return "그리스 신 아프로디테(Aphrodite)를 상징한다. 태양계 생성 중 지구에서 가장 밝게 보인다.\n이산화탄소로 이루어진 두꺼운 대기가 있다. 표면기압(약 90기압)이 높고 표면온도가(약 470℃) 매우 높다."
      
    case .earth:
      return "그리스 신 가이아(Gaia)를 상징한다. 물과 대기가 있어 생명체가 살고 있다. 바다가 있어 우주에서는 푸르게 보인다.\n위성이 1개(달) 있다."
      
    case .mars:
      return "그리스 신 아레스(Ares)를 상징한다. 토양에 산화 철 성분이 많아서 붉게 보인다.\n과거에 물이 흘렀던 흔적이 있다. 양극 지역에 극관이 존재, 계절의 변화가 나타난다. 위성이 2개(포보스, 데이모스) 있다."
      
    case .jupiter:
      return "그리스 신 제우스(Zeus)를 상징한다. 재양계 행성 중 크기가 가장 크다.\n표면에 적도와 나란한 줄무늬가 나타나고 대기의 소용돌이인 대적반이 나타난다. 고리가 존재하고 가니메데, 칼리스토 외에 많은 위성이 존재한다."
      
    case .saturn:
      return "그리스 신 크로노스(Kronos)를 상징한다. 물보다 밀도가 작으며 표면에 적도와 나란한 줄무늬가 나타난다.\n얼음, 암석 조각으로 이루어진 뚜렷한 고리가 존재한다. 수많은 위성 중 타이탄에는 대기가 있다."
      
    case .uranus:
      return "그리스 신 우라노스(Uranos)를 상징한다. 대기 중 메테인이 붉은 빛을 흡수하여 청록색으로 보인다.\n자전축이 공전 궤도면과 거의 나란하다. 고리가 존재한다."
      
    case .neptune:
      return "그리스 신 포세이돈(Poseidon)를 상징한다. 파란색으로 보인다.\n표면에 대기의 소용돌이로 생긴 대흑점(검은 점)이 나타나기도 한다. 가는 고리가 존재한다."
    }
  }
  
  var image: UIImage? {
    switch self {
    case .mercury:
      return UIImage(resource: R.image.solar.mercury)
      
    case .venus:
      return UIImage(resource: R.image.solar.venus)
      
    case .earth:
      return UIImage(resource: R.image.solar.earth)
      
    case .mars:
      return UIImage(resource: R.image.solar.mars)
      
    case .jupiter:
      return UIImage(resource: R.image.solar.jupiter)
      
    case .saturn:
      return UIImage(resource: R.image.solar.saturn)
      
    case .uranus:
      return UIImage(resource: R.image.solar.uranus)
      
    case .neptune:
      return UIImage(resource: R.image.solar.neptune)
    }
  }
}
