//
//  ContainerTest.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/15/23.
//
import UIKit

class ContainerViewTest: UIView {
    let cover = UIView()
    
    let duration: TimeInterval = 4
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("Override init")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("required init")
        addView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("Override layout")
    }
    
    func addView() {
        cover.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        cover.backgroundColor = .black
        addSubview(cover)
    }
    
    func coverView(completion: @escaping () -> Void) {
        print("Cover")
        let startRect = CGRect(x: 0, y: frame.height, width: frame.width, height: frame.height)
        let endRect = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
        DispatchQueue.main.async { [self] in
            cover.frame = startRect
            
            UIView.animate(withDuration: duration) { [self] in
                cover.frame = endRect
            } completion: { success in
                completion()
            }
        }
    }
    
    func uncoverView(completion: @escaping () -> Void) {
        UIView.animate(withDuration: duration) { [self] in
            cover.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: frame.height)
        } completion: { success in
            completion()
        }
    }
}
