//
//  LoadingLabel.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/14/23.
//

import UIKit

class LoadingLabel: UILabel {
    var baseString: String?
    var fontSize: CGFloat = 20
    
    var ticker: Timer?

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        animate()
        initializeLabel()
    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        initializeLabel()
//    }
    
    func initializeLabel(){
        text = baseString
        font = UIFont(name: "Avenir Next Demi Bold", size: fontSize)
    }
    
    func animate() {
        ticker = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(animateDots), userInfo: nil, repeats: true)
    }
    
    @objc func animateDots() {
        if text == baseString!+" ." {
            text = baseString!+" .."
        } else if text == baseString!+" .." {
            text = baseString!+" ..."
        } else if text == baseString!+" ..." {
            text = baseString!+" ."
        } else {
            text = baseString!+" ."
        }
    }
    
    func stopLoading() {
        ticker?.invalidate()
    }
}
