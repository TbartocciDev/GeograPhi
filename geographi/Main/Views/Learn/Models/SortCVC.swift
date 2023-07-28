//
//  SortCVC.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/11/23.
//

import UIKit

class SortCVC: UICollectionViewCell {
    @IBOutlet weak var sortBtn: CustomSortButton!
    
    func configureCell(title: String) {
        sortBtn.setTitle(title, for: .normal)
        sortBtn.setSelect()
        sortBtn.backgroundColor = UIColor(named: "App Background Light")
        sortBtn.tintColor = UIColor(named: "Text")
        sortBtn.layer.borderWidth = 1
    }
}
