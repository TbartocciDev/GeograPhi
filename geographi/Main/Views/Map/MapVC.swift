//
//  MapVC.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/3/23.
//

import UIKit

class MapVC: UIViewController {
    @IBOutlet weak var imageScroll: UIScrollView!
    @IBOutlet weak var imagesView: UIView!
    
    let countries = ["Afghanistan","Albania","Algeria"]

    override func viewDidLoad() {
        super.viewDidLoad()
        imageScroll.delegate = self
        imageScroll.minimumZoomScale = 1.0
        imageScroll.maximumZoomScale = 10.0
        
        overlayImages()
        print("map")
    }
    


    func overlayImages(){
        let world = UIImageView(frame: imagesView.frame)
        world.contentMode = .scaleAspectFit
        world.image = UIImage(named: "World")
        imagesView.addSubview(world)
        
        countries.forEach { country in
            let countryImg = UIImageView(frame: imagesView.frame)
            countryImg.contentMode = .scaleAspectFit
            countryImg.image = UIImage(named: "\(country)New")
            countryImg.tintColor = .systemGreen
            imagesView.addSubview(countryImg)
        }
    }
}

extension MapVC: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imagesView
    }
    
}
