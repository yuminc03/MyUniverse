//
//  Colors.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/16.
//

import UIKit

/// My Universe에서 사용할 색깔들을 관리
enum Colors: String {
    case mainColor
    case subColor
    case purple_B080FF
    case gray_EAEAEA
    case blue_218FF5
    case black_000000
}

func myUniColor(_ color: Colors) -> UIColor? {
    UIColor(named: color.rawValue)
}
