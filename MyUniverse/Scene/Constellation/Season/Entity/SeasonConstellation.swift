import Foundation

struct SeasonConstellation: Equatable, Identifiable {
  let id = UUID()
  let name: String
  let description: String
  
  static let dummy = SeasonConstellations.allCases.map {
    SeasonConstellation(name: $0.name, description: $0.description)
  }
}
