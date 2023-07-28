//
//  CountryDetailVC.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/11/23.
//

import UIKit

class CountryDetailVC: UIViewController {
    @IBOutlet weak var flagImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var regionLbl: UILabel!
    @IBOutlet weak var capitalLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    

    var currentCountry: Country = Country(name: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIData(country: currentCountry)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.tintColor = UIColor(named:"Text")
        // Do any additional setup after loading the view.
    }


    func setUIData(country: Country) {
        flagImg.parse(from: (country.flags?.png)!)
        nameLbl.text = "\(country.name) (\(country.alpha3Code ?? "N/A"))"
        regionLbl.text = "Located in \(country.region ?? "N/A")"
        capitalLbl.text = "The capital is \(country.capital ?? "N/A")"
        populationLbl.text = "Has approximately \(country.population!.giveCommas()) citizens as of 2023"
    }
}
