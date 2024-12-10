import Foundation

struct NebulaModel: Equatable, Identifiable {
  let id = UUID()
  let name: String
  let description: String
  
  static let dummy = Nebula.allCases.map {
    NebulaModel(name: $0.name, description: $0.description)
  }
}
