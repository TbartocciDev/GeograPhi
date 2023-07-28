//
//  TabBarButton.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/15/23.
//

import UIKit

class TabBarButton: UIView {
    var selectView = UIView()
    var img = UIImageView()
    var btn = UIButton()
    
    var padding: CGFloat = 8
    var imgPadding: CGFloat = 6
    var tint: UIColor?
    var imageName: String?

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layoutViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutViews()
    }
    
    func layoutViews(){
        backgroundColor = UIColor(named: "App Background")
        let selectSize = frame.height - (padding * 2)
        selectView.frame = CGRect(x: (frame.width / 2) - (selectSize / 2), y: padding, width: selectSize, height: selectSize)
        selectView.layer.borderWidth = 2
        selectView.layer.cornerRadius = 5
        addSubview(selectView)
        
        img.frame = CGRect(x: imgPadding, y: imgPadding, width: selectView.frame.width - (imgPadding * 2), height: selectView.frame.height - (imgPadding * 2))
        img.image = UIImage(systemName: imageName ?? "circle")
        img.contentMode = .scaleAspectFit
        img.tintColor = tint
        selectView.addSubview(img)
        
        btn.setTitle("", for: .normal)
        btn.frame = selectView.frame
        btn.tag = tag
        addSubview(btn)
    }

}
