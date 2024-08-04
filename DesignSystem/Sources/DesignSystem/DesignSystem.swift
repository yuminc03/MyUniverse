import Foundation
import UIKit

public enum MUColor: String {
  case BGColor
  case blue100
  case blue200
  case blue300
  case gray100
  case gray200
  case gray300
  case gray400
  case gray500
  case pink100
  case pink200
  case pink300
  case purple100
  case purple200
  case yellow100
  case yellow200
  case yellow300
}

public struct DesignSystem {
  
  public static func myUniColor(_ color: MUColor) -> UIColor {
    guard let color = UIColor(named: color.rawValue, in: Bundle.module, compatibleWith: .none) else {
      fatalError("Do not find Color.")
    }
    
    return color
  }
}
