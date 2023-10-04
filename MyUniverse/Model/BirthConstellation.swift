//
//  BirthConstellation.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/10/03.
//

import SwiftUI
import Foundation

/// 탄생 별자리
struct BirthConstellation: Equatable, Identifiable {
  let id = UUID()
  let name: String
  let date: String
  let imageName: String
  
  static let dummy: [BirthConstellation] = [
    .init(name: "물병자리", date: "1/20 ~ 2/18", imageName: "char_aquarius"),
    .init(name: "물고기자리", date: "2/19 ~ 3/20", imageName: "char_pisces"),
    .init(name: "양자리", date: "3/21 ~ 4/20", imageName: "char_aries"),
    .init(name: "황소자리", date: "4/21 ~ 5/20", imageName: "char_taurus"),
    .init(name: "쌍둥이자리", date: "5/21 ~ 6/21", imageName: "char_gemini"),
    .init(name: "게자리", date: "6/22 ~ 7/22", imageName: "char_cancer"),
    .init(name: "사자자리", date: "7/23 ~ 8/22", imageName: "char_leo"),
    .init(name: "처녀자리", date: "8/23 ~ 9/22", imageName: "char_virgo"),
    .init(name: "천칭자리", date: "9/23 ~ 10/23", imageName: "char_libra"),
    .init(name: "전갈자리", date: "10/24 ~ 11/21", imageName: "char_scorpio"),
    .init(name: "궁수자리", date: "11/22 ~ 12/21", imageName: "char_sagittarius"),
    .init(name: "염소자리", date: "12/22 ~ 1/19", imageName: "char_capricorn")
  ]
}
