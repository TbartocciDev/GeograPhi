//
//  CountryTVC.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/3/23.
//

import UIKit

class CountryTVC: UITableViewCell {
    @IBOutlet weak var countryNameLbl: UILabel!
    @IBOutlet weak var countryCapitalLbl: UILabel!
    @IBOutlet weak var countryFlagImg: UIImageView!
    
    let paddingSize: CGFloat = 8
    
    var country: Country = Country(name: "Fake Data", capital: "Here's some more")

    func configureCell() {
        countryNameLbl.text = country.name
        countryCapitalLbl.text = country.capital
        countryFlagImg.parse(from: (country.flags?.png)!)
        contentView.layer.cornerRadius = 10
        backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0)
        selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: paddingSize, left: paddingSize, bottom: paddingSize, right: paddingSize))
    }

}
