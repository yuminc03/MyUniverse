//
//  SeasonConstellations.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/12/09.
//

import Foundation

enum SeasonConstellations: String, CaseIterable {
  case spring
  case summer
  case fall
  case winter
  
  /// 별자리 제목
  var name: String {
    switch self {
    case .spring:
      return "봄철 별자리"
      
    case .summer:
      return "여름철 별자리"
      
    case .fall:
      return "가을철 별자리"
      
    case .winter:
      return "겨울철 별자리"
    }
  }
  
  /// 별자리 설명
  var description: String {
    switch self {
    case .spring:
      return "봄철 별자리는 사자자리, 목동자리, 처녀자리, 사냥개자리등이 있습니다.\n그 중에서도 볼철의 길잡이 별은 사자자리의 데네볼라, 처녀자리의 스피카, 목동자리의 아크투루스가 있습니다.\n이 세개의 길잡이 별들은 봄철의 대삼각형을 이룹니다. 그리고 북두칠성의 손잡이부분 끝 별과 아크투루스, 스피카가 봄의 대곡선을 이루기도 합니다."
      
    case .summer:
      return "여름철 별자리는 백조자리, 거문고자리, 독수리자리, 헤르쿨레스자리 등이 있습니다.\n그 중에서도 여름철의 길잡이 별은 백조자리의 데네브, 거문고자리의 베가(직녀성), 독수리자리의 알타이르(견우성)가 있습니다.\n이 세개의 길잡이 별들은 여름철 대삼각형을 이룹니다. 그리고 은하수를 사이에 둔 견우(알타이르)와 직녀(베가)가 칠월칠석날 서로 만나기를 기다리는 장면을 볼 수 있습니다."
    case .fall:
      return "가을철 별자리는 페가수스자리, 물고기자리, 안드로메다자리, 양자리 등이 있습니다.\n그 중에서도 가을철의 길잡이 별은 페가수스자리의 (왼쪽 위)알페라츠, (오른쪽 위)쉬트, (오른쪽 아래)마르카브, (왼쪽 아래)알게니브가 있습니다.\n이 네개의 길잡이 별들은 가을철 대사각형을 이룹니다. 밝은 별이 많이 보이지는 않지만 우리나라의 가을은 맑은 날이 많아서 어두운 별도 비교적 찾을 수 있을 겁니다."
      
    case .winter:
      return "겨울철 별자리는 큰개자리, 작은개자리, 오리온자리, 쌍둥이자리, 마차부자리, 황소자리 등이 있습니다.\n그 중에서도 겨울철의 길잡이 별은 작은개자리의 프로키온, 큰개자리의 시리우스, 오리온자리의 베텔게우스가 있습니다.\n이 세개의 길잡이 별들은 겨울철 대삼각형을 이룹니다. 그리고 프로키온, 시리우스, 리겔(오리온자리), 알데바란(황소자리), 카펠라(마차부자리), 폴룩스 (쌍둥이자리)는 겨울의 다이아몬드를 이룹니다.\n겨울의 밤하늘은 사계절중, 가장 화려한 밤하늘을 볼 수 있습니다."
    }
  }
  
  /// 이미지 이름
  var imageName: String {
    switch self {
    case .spring:
      return "spring_star"
      
    case .summer:
      return "summer_star"
      
    case .fall:
      return "fall_star"
      
    case .winter:
      return "winter_star"
    }
  }
}
