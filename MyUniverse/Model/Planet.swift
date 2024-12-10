import Foundation

struct Planet: Equatable, Identifiable {
  let id = UUID()
  let name: String
  let description: String
  
  static let dummy = Planets.allCases.map {
    Planet(name: $0.name, description: $0.description)
  }
}
