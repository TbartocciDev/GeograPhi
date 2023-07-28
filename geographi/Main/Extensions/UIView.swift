//
//  UIView.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/14/23.
//

import UIKit

extension UIView {
    func cornerBorders(radius: CGFloat, corners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = corners
    }
    
    func highlightView() {
        layer.shadowOpacity = 0.5
        layer.shadowOffset = .zero
        layer.shadowRadius = frame.height / 7
        layer.shadowColor = UIColor.yellow.cgColor
    }
}
