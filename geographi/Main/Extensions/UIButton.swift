//
//  UIButton.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/12/23.
//

import UIKit

extension CustomSortButton {
    func setSelect() {
        var tint: UIColor
        if isSorting {
            tint = UIColor(named: "Electric Blue") ?? .red
        } else {
            tint = UIColor(named: "App Background Light") ?? .red
        }
        backgroundColor = tint
    }
}
