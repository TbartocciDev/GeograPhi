//
//  CustomContainerView.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/15/23.
//

import UIKit

class CustomContainerView: UIView {
    let cover = UIView()
    
    var isCovered: Bool?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("Override init")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("required init")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("Override layout")
    }
    
    func layoutSubViews() {
        cover.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        cover.backgroundColor = .black
        addSubview(cover)
    }
    
    func coverView(completion: @escaping () -> Void) {
        cover.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: frame.height)
        
        UIView.animate(withDuration: 4) { [self] in
            cover.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        } completion: { success in
            completion()
        }
    }
    
    func uncoverView(completion: @escaping () -> Void) {
        cover.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
        UIView.animate(withDuration: 4) { [self] in
            cover.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: frame.height)
        } completion: { success in
            completion()
        }
    }

}
