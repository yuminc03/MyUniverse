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
    let image: ImageResource
  }
  
  static let constellationDummy: Universe = .init(
    name: "별자리",
    stars: [
      .init(name: "탄생 별자리", image: .Thumb.birthConstellThumb),
      .init(name: "계절별 별자리", image: .Thumb.seasonConstellThumb)
    ]
  )
  
  static let solarSystemDummy: Universe = .init(
    name: "태양계",
    stars: [
      .init(name: "행성", image: .Thumb.planetThumb),
      .init(name: "태양", image: .Thumb.sunThumb)
    ]
  )
  
  static let interstellarMaterialDummy: Universe = .init(
    name: "성간물질",
    stars: [
      .init(name: "소행성", image: .Thumb.asteroidThumb),
      .init(name: "성운", image: .Thumb.nebulaThumb),
      .init(name: "은하", image: .Thumb.galaxyThumb)
    ]
  )
}
