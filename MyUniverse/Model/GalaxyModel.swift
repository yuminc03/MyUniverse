//
//  GalaxyModel.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/12/25.
//

import Foundation

struct GalaxyModel: Equatable {
  let name: String
  let description: String
  
  static let dummy = Galaxy.allCases.map {
    GalaxyModel(name: $0.name, description: $0.description)
  }
}
