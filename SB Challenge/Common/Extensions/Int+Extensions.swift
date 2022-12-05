//
//  Int+Extensions.swift
//  SB Challenge
//
//  Created by George Kiplagat on 05/12/2022.
//

import Foundation

extension Int {
    func formatNumber() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}
