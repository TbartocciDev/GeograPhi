//
//  CustomProgressBar.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/11/23.
//

import UIKit

class CustomProgressBar: UIView {
    var backgroundView: UIView = UIView()
    var borderView: UIView = UIView()
    var progressView: UIView = UIView()
    
    var trackColor: UIColor = UIColor(named: "App Highlight") ?? .red
    var progressColor: UIColor = UIColor(named: "Electric Blue") ?? .red
    
    var progress: CGFloat = 0
    
    var cornerRadius: CGFloat = 0
    
    var observedProgess: Progress?

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubViews()
    }
    
    func addSubViews() {
        cornerRadius = frame.height / 2
        backgroundColor = .none
        
        highlightView()
        
        backgroundView.backgroundColor = trackColor
        backgroundView.frame = self.bounds
        backgroundView.layer.cornerRadius = cornerRadius
        
        borderView.frame = backgroundView.bounds
        borderView.backgroundColor = .none
        borderView.layer.borderWidth = 2
        borderView.layer.borderColor = UIColor(named: "Dark Blue")?.cgColor
        borderView.layer.cornerRadius = cornerRadius
        
        progressView.backgroundColor = progressColor
        progressView.frame = CGRect(x: 0, y: 0, width: frame.width * progress, height: frame.height)
        
        addSubview(backgroundView)
        backgroundView.addSubview(progressView)
        backgroundView.addSubview(borderView)
        backgroundView.clipsToBounds = true
    }
    
    func setProgress(progress: CGFloat, animated: Bool, completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now()) { [self] in
            if animated {
                UIView.animate(withDuration: 3) { [self] in
                    progressView.frame.size.width = (frame.width * progress)
                }
            } else {
                progressView.frame = CGRect(x: 0, y: 0, width: frame.width * progress, height: frame.height)
            }
            self.progress = progress
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                completion()
            }
        }
    }
    
}
