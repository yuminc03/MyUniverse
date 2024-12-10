//
//  Array+.swift
//  LabsProject
//
//  Created by Yumin Chu on 2023/07/23.
//

import Foundation

extension Array {
    
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
