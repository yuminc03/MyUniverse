import Foundation

struct GalaxyModel: Equatable {
  let name: String
  let description: String
  
  static let dummy = Galaxy.allCases.map {
    GalaxyModel(name: $0.name, description: $0.description)
  }
}
