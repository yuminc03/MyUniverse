import Foundation
import UIKit

/// 탄생 별자리
enum BirthConstellations: String, CaseIterable {
  case aquarius
  case pisces
  case aries
  case taurus
  case gemini
  case cancer
  case leo
  case virgo
  case libra
  case scorpio
  case sagittarius
  case capricorn
  
  /// 이름
  var name: String {
    switch self {
    case .aquarius: return "물병자리"
    case .pisces: return "물고기자리"
    case .aries: return "양자리"
    case .taurus: return "황소자리"
    case .gemini: return "쌍둥이자리"
    case .cancer: return "게자리"
    case .leo: return "사자자리"
    case .virgo: return "처녀자리"
    case .libra: return "천칭자리"
    case .scorpio: return "전갈자리"
    case .sagittarius: return "궁수자리"
    case .capricorn: return "염소자리"
    }
  }
  
  /// 캐릭터 이미지
  var characterImage: UIImage? {
    switch self {
    case .aquarius:
      return UIImage(resource: R.image.constellation.birth.char_aquarius)
      
    case .pisces:
      return UIImage(resource: R.image.constellation.birth.char_pisces)
      
    case .aries:
      return UIImage(resource: R.image.constellation.birth.char_aries)
      
    case .taurus:
      return UIImage(resource: R.image.constellation.birth.char_taurus)
      
    case .gemini:
      return UIImage(resource: R.image.constellation.birth.char_gemini)
      
    case .cancer:
      return UIImage(resource: R.image.constellation.birth.char_cancer)
      
    case .leo:
      return UIImage(resource: R.image.constellation.birth.char_leo)
      
    case .virgo:
      return UIImage(resource: R.image.constellation.birth.char_virgo)
      
    case .libra:
      return UIImage(resource: R.image.constellation.birth.char_libra)
      
    case .scorpio:
      return UIImage(resource: R.image.constellation.birth.char_scorpio)
      
    case .sagittarius:
      return UIImage(resource: R.image.constellation.birth.char_sagittarius)
      
    case .capricorn:
      return UIImage(resource: R.image.constellation.birth.char_capricorn)
    }
  }
  
  /// 날짜
  var dateString: String {
    switch self {
    case .aquarius: return "1/20 ~ 2/18"
    case .pisces: return "2/19 ~ 3/20"
    case .aries: return "3/21 ~ 4/20"
    case .taurus: return "4/21 ~ 5/20"
    case .gemini: return "5/21 ~ 6/21"
    case .cancer: return "6/22 ~ 7/22"
    case .leo: return "7/23 ~ 8/22"
    case .virgo: return "8/23 ~ 9/22"
    case .libra: return "9/23 ~ 10/23"
    case .scorpio: return "10/24 ~ 11/21"
    case .sagittarius: return "11/22 ~ 12/21"
    case .capricorn: return "12/22 ~ 1/19"
    }
  }
  
  /// 내용
  var description: String {
    switch self {
    case .aquarius:
      return "물병자리는 가을철 남쪽하늘에서 보이는 별자리입니다.\n그리스신화에서 독수리에게 납치당해 신들에게 술을 따라주는 일을 하게 된 트로이의 왕자 '가니메데'로 등장합니다.\n믿거나 말거나, 물병자리는 항상 객관적인 관찰자 역할을 하며 사심과 감정이 섞이지 않은 견해를 밝힙니다."
      
    case .pisces:
      return "물고기자리는 가을철 남쪽하늘에 보이는 별자리입니다.\n그리스신화에서 물고기 두마리는 '아프로디테'와 '에로스'가 변신한 것으로 나옵니다.\n믿거나 말거나, 물고기자리는 감상적이고 인정이 많고 부드러운 감정의 소유자이며, 주위 환경이나 다른 사람들의 감정을 잘 받아들입니다."
      
    case .aries:
      return "양자리는 가을철 남쪽하늘의 별자리입니다.\n그리스신화에서 아마타스 왕의 '프릭소스'와 '헬레'라는 두 남매의 전설에서 등장합니다.\n믿거나 말거나, 양자리는 모든 일에 적극적이어서 끊임없는 프로젝트 추진과 활발한 활동으로 빠르게 앞으로 나아갑니다."
      
    case .taurus:
      return "황소자리는 겨울철 남쪽하늘의 별자리입니다.\n그리스신화에서 '제우스'가 페키니아의 공주 유로파를 유혹하기 위해서 변신한 모습으로 등장합니다.\n믿거나 말거나, 황소자리는 정착과 안정을 바라기 때문에 상황을 지금 그대로 유지하는 쪽을 좋아합니다. 변화와 불안정을 겪는 시기에는 새로운 상황에 적응하는 데 어려움을 겪을 수 있습니다."
      
    case .gemini:
      return "쌍둥이자리는 겨울철 하늘 한가운데에 보이는 별자리입니다.\n그리스신화에서 쌍둥이 형제인 '카스토르'와 '폴룩스'로 등장합니다.\n믿거나 말거나, 쌍둥이자리는 대체로 얼굴이 밝고 표정이 풍부하며, 이야기하는 걸 좋아해 몇 시간이고 거뜬히 수다를 늘어놓을 수 있습니다."
      
    case .cancer:
      return "게자리는 초봄, 쌍둥이자리와 사자자리 사이에서 볼 수 있는 별자리입니다.\n그리스신화에서 헤라의 명령에 따라 헤라클레스의 발가락을 문 '게'로 등장합니다.\n믿거나 말거나, 게자리는 기분 변화가 심하며 성격이 다소 복잡합니다. 때로는 든든한 언덕처럼, 다른 한편으로는 아이 같은 모습을 보입니다."
      
    case .leo:
      return "사자자리는 봄철 남쪽하늘에서 볼 수 있는 별자리입니다.\n그리스신화에서 헤라클레스가 네메아 골짜기의 '사자'를 물리쳤고 제우스가 아들 헤라클레스의 용맹을 기리기 위해 '사자'를 별자리로 만들었다.\n믿거나 말거나, 사자자리는 사람들이 자신을 좋게 생각해주길 바라고, 자신이 남들에게 어떤 인상을 주는지 굉장히 의식합니다."
      
    case .virgo:
      return "처녀자리는 봄철 남쪽하늘, 사자자리와 천칭자리 사이에서 볼 수 있는 별자리입니다.\n그리스신화에서는 지상에서 인간들에게 정의의 길을 설명하던 정의의 여신 '아스트라이아'로 등장합니다.\n믿거나 말거나, 처녀자리는 결함을 지적당하는 건 달가워하지 않지만, 자신의 결점을 스스로 잘 알기 때문에 겸손하고 잘난 척하지 않습니다."
      
    case .libra:
      return "천칭자리는 초여름 무렵 남쪽 하늘 처녀자리와 전갈자리 사이에서 볼 수 있는 별자리입니다.\n그리스신화에서 정의의 여신 아스트라이아가 가지고 다니던 '정의의 저울대'로 알려져 있습니다.\n믿거나 말거나, 천칭자리는 예술적 감각을 타고났으며, 색채에 대한 타고난 안목이 있어 고상하고 조화로운 환경에 둘러싸여 있어야 합니다."
      
    case .scorpio:
      return "전갈자리는 여름철 남쪽 하늘의 별자리입니다.\n그리스신화에서 오리온의 자만심이 너무 높아서 헤라가 오리온을 죽이기 위해 풀어놓은 '전갈'이라고 한다.\n믿거나 말거나, 전갈자리는 상대방에게 온갖 질문을 던지면서도 정작 자기 자신에 대해서는 거의 드러내지 않습니다."
      
    case .sagittarius:
      return "궁수자리는 여름부터 초가을 사이에 남쪽 하늘에서 볼 수 있는 은하수 가운데에 자리잡은 별자리입니다.\n그리스신화에서 헤라클레스와 아킬레우스에게 천문학과 무술을 가르친 스승, '케이론'이다.\n믿거나 말거나, 궁수자리는 열정적이면서 마음이 따뜻하고 관대해서 감정을 숨김없이 드러냅니다."
      
    case .capricorn:
      return "염소자리는 궁수자리의 동쪽, 물병자리의 남쪽에 위치하는 가을철 남쪽하늘의 별자리입니다.\n그리스신화에서 가축의 신 '판'이 거인 족 티폰을 피하려고 변신을 서두르다가 상반신은 염소로 하반신은 물고기의 모습으로 변했다.\n믿거나 말거나, 염소자리는 경솔하거나 변덕스럽지 않으며 책임을 진지하게 받아들이고 집과 가족을 우선순위의 맨 위에 놓습니다."
    }
  }
}
