//
//  UIViewController.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/15/23.
//

import UIKit

extension UIViewController {
    func swapViewsAnimation(previousView: UIView, nextView: UIView) {
        
    }
}

extension UIView {
    func coverAnimation() {
        print("Cover")
        let cover = UIView()
        cover.backgroundColor = .black
        cover.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: frame.height)
        addSubview(cover)
        
        UIView.animate(withDuration: 4) { [self] in
            cover.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        }
    }
    
    func uncoverAnimation() {
        print("uncover")
    }
}
