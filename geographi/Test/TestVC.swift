//
//  TestVC.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/15/23.
//

import UIKit

class TestVC: UIViewController {
    
    let viewOne = UIView()
    let viewTwo = UIView()
    let cover = UIView()
    let stackView = UIStackView()
    
    let stackHeight: CGFloat = 100
    let duration: TimeInterval = 0.4

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews {
            self.addCover {
                self.styleStackView()
            }
        }
        
    }
    
    @objc func btnTapped(sender: UIButton) {
//        print("tapped")
        if sender.tag == 0 {
//            cover.backgroundColor = viewTwo.backgroundColor
            coverView { [self] in
                viewOne.isHidden = false
                
                viewTwo.isHidden = true
                uncoverView {

                }
            }
        } else {
//            cover.backgroundColor = viewOne.backgroundColor
            coverView { [self] in
                viewOne.isHidden = true
                
                viewTwo.isHidden = false
                uncoverView {

                }
            }
        }
    }
    func addViews(completion: @escaping () -> Void) {
        
        let viewFrame = view.frame
        viewOne.frame = CGRect(x: 0, y: 0, width: viewFrame.width, height: viewFrame.height - stackHeight)
        viewOne.backgroundColor = .systemPink
        viewOne.layer.zPosition = 0
        view.addSubview(viewOne)
        
        viewTwo.frame = CGRect(x: 0, y: 0, width: viewFrame.width, height: viewFrame.height - stackHeight)
        viewTwo.backgroundColor = .orange
        viewTwo.layer.zPosition = 0
        view.addSubview(viewTwo)
        
        let lbl = UILabel()
        lbl.frame = CGRect(x: 0, y: 200, width: viewOne.frame.width, height: 200)
        lbl.text = "Heres some text blah blah"
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "Avenir Next Bold", size: 35)
        lbl.numberOfLines = 0
        
        let otherLbl = UILabel()
        otherLbl.frame = CGRect(x: 0, y: 500, width: viewOne.frame.width, height: 200)
        otherLbl.text = "Heres some text blah blah"
        otherLbl.textAlignment = .center
        otherLbl.font = UIFont(name: "Avenir Next Bold", size: 25)
        otherLbl.numberOfLines = 0
        
        viewOne.addSubview(lbl)
        viewOne.addSubview(otherLbl)
        
        completion()
    }
    
    func addCover(completion: @escaping () -> Void) {
        let viewFrame = view.frame
        cover.frame = CGRect(x: 0, y: viewFrame.height, width: viewFrame.width, height: viewFrame.height)
        cover.layer.zPosition = 1
        cover.backgroundColor = .systemGreen
        
        view.addSubview(cover)
        
        completion()
    }
    
    func styleStackView() {
        let viewFrame = view.frame
        stackView.frame = CGRect(x: 0, y: viewFrame.height - stackHeight, width: viewFrame.width, height: stackHeight)
        stackView.backgroundColor = .red
        stackView.layer.zPosition = 2
        view.addSubview(stackView)
        
        let stackFrame = stackView.frame
        
        for i in 0...1 {
            let btn = UIButton()
            btn.tag = i
            btn.frame = CGRect(x: (stackFrame.width / 2) * CGFloat(i), y: 0, width: stackFrame.width / 2, height: stackFrame.height)
            btn.setTitle("test \(i)", for: .normal)
            btn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
            stackView.addSubview(btn)
        }
    }
    
    func coverView(completion: @escaping () -> Void) {
        let endRect = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        UIView.animate(withDuration: duration) { [self] in
            cover.frame = endRect
        } completion: { success in
            completion()
        }
    }
    
    func uncoverView(completion: @escaping () -> Void) {
        let endRect = CGRect(x: 0, y: -view.frame.height, width: view.frame.width, height: view.frame.height)
        let resetRect = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: self.view.frame.height)
        
        UIView.animate(withDuration: duration) { [self] in
            cover.frame = endRect
        } completion: { success in
            self.cover.frame = resetRect
        }
    }

}
