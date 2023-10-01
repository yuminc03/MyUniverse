//
//  Universe.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/09/23.
//

import Foundation

struct Universe: Equatable {
  let name: String
  let stars: [Star]
  
  struct Star: Equatable {
    let name: String
  }
  
  static let constellationDummy: Universe = .init(
    name: "별자리",
    stars: [
      .init(name: "탄생 별자리"),
      .init(name: "계절별 별자리")
    ]
  )
  
  static let solarSystemDummy: Universe = .init(
    name: "태양계",
    stars: [
      .init(name: "행성"),
      .init(name: "태양")
    ]
  )
  
  static let interstellarMaterialDummy: Universe = .init(
    name: "성간물질",
    stars: [
      .init(name: "소행성"),
      .init(name: "성운"),
      .init(name: "은하")
    ]
  )
}
