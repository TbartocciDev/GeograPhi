//
//  UIImageView.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/15/23.
//

import UIKit

extension UIImageView {
    func parse(from: String) {
        if let imageUrl: URL = URL(string: from) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: imageUrl) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }
    }
}
