//
//  BirthConstellations.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/10/06.
//

import Foundation

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
  
  /// 캐릭터 이미지 이름
  var characterImageName: String {
    return "char_" + rawValue
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
}
