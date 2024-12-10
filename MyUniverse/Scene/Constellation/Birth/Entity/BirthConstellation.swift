import SwiftUI
import Foundation

/// 탄생 별자리
struct BirthConstellation: Equatable, Identifiable {
  let id = UUID()
  let name: String
  let date: String
  
  static let dummy = BirthConstellations.allCases.map {
    BirthConstellation(name: $0.name, date: $0.dateString)
  }
}
