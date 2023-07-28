//
//  GameTVC.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/12/23.
//

import UIKit

class GameTVC: UITableViewCell {
    @IBOutlet weak var gameView: UIView!
    @IBOutlet weak var levelBtn: UIButton!
    @IBOutlet weak var lockedView: UIView!
    @IBOutlet weak var levelXConstraint: NSLayoutConstraint!
    
    var indexNum: Int = 0
    var isLocked: Bool = true
    
    @objc
    func gameTapped() {
        print(indexNum)
    }
    
    func configureCell(distance: CGFloat, levelNum: String) {
//        gameView.highlightView()
        if !isLocked {
            lockedView.isHidden = true
        }
        gameView.layer.cornerRadius = frame.height / 8
        levelBtn.setTitle(levelNum, for: .normal)
        levelBtn.tag = indexNum
        levelBtn.addTarget(self, action: #selector(gameTapped), for: .touchUpInside)
        selectionStyle = .none
        levelXConstraint.constant = distance
    }

}
