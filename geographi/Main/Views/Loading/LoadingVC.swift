//
//  LoadingVC.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/11/23.
//

import UIKit

class LoadingVC: UIViewController {
    @IBOutlet weak var appTitleLbl: UILabel!
    @IBOutlet weak var progressBar: CustomProgressBar!
    @IBOutlet weak var loadingStrLbl: LoadingLabel!
    
    var progressObservation: NSKeyValueObservation?
    
    var ticker: Timer?
    
    deinit {
        progressObservation?.invalidate()
    }
    
    var allCountries: [Country] = []
    var organizedCountries: [Country] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        loadingStrLbl.baseString = "Cultivating Content"
        
        getCountries { [self] in
            organizedCountries = cleanCountryData(data: allCountries, completion: { [self] in
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                    progressBar.setProgress(progress: 1, animated: true, completion: { [self] in
                        performSegue(withIdentifier: "finishLoading", sender: nil)
                        loadingStrLbl.stopLoading()
                    })
                }
            })
        }
        
//        progressBar.setProgress(progress: 1, animated: true) { [self] in
//            performSegue(withIdentifier: "finishLoading", sender: nil)
//        }
        
//        progressBar.setProgress(progress: 0.3, animated: true) {
//
//        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "finishLoading" {
            let destination = segue.destination as! ViewController
            if organizedCountries.count > 0 {
                destination.countries = organizedCountries
            }
        }
    }
    
    func getCountries(completion: @escaping () -> Void){
        var apiComponents = URLComponents()
        apiComponents.scheme = "https"
        apiComponents.host = "restcountries.com"
        apiComponents.path = "/v2/all"
        
        let apiURL = apiComponents.url
        
        let countryParseTask = URLSession.shared.dataTask(with: apiURL!) { [self] data, response, err in
            guard let data = data, err == nil else {
                print("Error fetching data")
                return
            }
            do {
                allCountries = try JSONDecoder().decode([Country].self, from: data)
            } catch {
                print("Error parsing data")
            }
            completion()
        }
        progressObservation = countryParseTask.progress.observe(\.fractionCompleted) { [self] progress, _ in
            progressBar.setProgress(progress: (progress.fractionCompleted) * 0.7, animated: true, completion: {
                
            })
          }
        countryParseTask.resume()
    }
}
