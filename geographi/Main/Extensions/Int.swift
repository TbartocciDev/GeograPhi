//
//  Int.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/27/23.
//

import Foundation

extension Int {
    func giveCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}
