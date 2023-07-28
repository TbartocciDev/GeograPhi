//
//  ViewController.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/3/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var safeCoverView: UIView!
    @IBOutlet weak var learnView: UIView!
    @IBOutlet weak var playView: UIView!
    @IBOutlet weak var mapView: UIView!
    
    @IBOutlet weak var learnTab: TabBarButton!
    @IBOutlet weak var playTab: TabBarButton!
    @IBOutlet weak var mapTab: TabBarButton!

    var views: [UIView] = []
    var tabs: [TabBarButton] = []
    var btns: [UIButton] = []
    var coverColors: [UIColor] = []
    var images: [String] = []
    
    var countries: [Country] = [
        Country(name: "Canada", region: "North America"),
        Country(name: "Brazil", region: "South America"),
        Country(name: "France", region: "Europe"),
        Country(name: "China", region: "Asia"),
        Country(name: "Senegal", region: "Africa"),
        Country(name: "Australia", region: "Oceania")
    ]
    
    var regions: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var index = 0
        views = [learnView, playView, mapView]
        tabs = [learnTab, playTab, mapTab]
        images = ["books.vertical","play.fill","globe.americas.fill"]
        coverColors = [UIColor(named: "Hot Pink")!, UIColor(named: "Electric Blue")!, UIColor(named: "Autumn Orange")!]
        tabs.forEach { tab in
            tab.btn.addTarget(self, action: #selector(tabBtnTapped), for: .touchUpInside)
            tab.imageName = images[index]
            tab.tint = coverColors[index]
            index += 1
        }
        
        showView(viewIndex: 1)
        self.navigationController?.isNavigationBarHidden = true
        getHighestPopulation { [self] in 
            print(countries[0])
        }
    }
    
    func getRegions(arr: [Country], completion: @escaping () -> Void){
        arr.forEach { country in
            guard let region = country.region else { return }
            if !regions.contains(region) {
                regions.append(region)
            }
        }
        completion()
    }
    
    func getHighestPopulation(completion: @escaping () -> Void) {
//        countries.sort {$0.population! > $1.population!}
        completion()
    }
    
    @objc func tabBtnTapped(sender: TabBarButton) {
        showView(viewIndex: sender.tag)
    }
    
    func showView(viewIndex: Int) {
        safeCoverView.backgroundColor = coverColors[viewIndex]
        views.forEach { view in
            view.isHidden = true
        }
        views[viewIndex].isHidden = false

        tabs.forEach { tab in
            tab.selectView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        }
        tabs[viewIndex].selectView.layer.borderColor = UIColor.gray.cgColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        getRegions(arr: countries) { [self] in
            countries.sort { $0.name < $1.name }
        }
        if segue.identifier == "learn" {
            let destination = segue.destination as! LearnVC
            destination.countries = countries
            destination.regions = regions
        } else if segue.identifier == "play" {
            let destination = segue.destination as! PlayVC
            regions.append("World")
            destination.countries = countries
            destination.regions = regions
        }
    }

}

