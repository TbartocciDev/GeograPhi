//
//  LearnVC.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/3/23.
//

import UIKit

class LearnVC: UIViewController {
    @IBOutlet weak var sortCardView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var countriesTableView: UITableView!
    @IBOutlet weak var sortCollectionView: UICollectionView!
    
    @IBOutlet weak var sortTypeLbl: UILabel!
    @IBOutlet weak var resultsLbl: UILabel!
    
    
    @IBOutlet weak var cardHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var sortHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var sortOptionsBottomConstaint: NSLayoutConstraint!
    
    var countries: [Country] = []
    var regionalCountries: [Country] = []
    var filteredCountries: [Country] = []
    var regions: [String] = []
    var detailCountry: Country = Country(name: "")
    
    var cardCollapsedHeight: CGFloat = 200
    var cardCornerRadius: CGFloat = 30
    
    var sortExpanded: Bool = false
    var sortCollapsedHeight: CGFloat = 0
    var sortExpandedHeight: CGFloat = 100
    
    var sortBtns: [CustomSortButton] = []
    var sortType: String = "None"

    override func viewDidLoad() {
        super.viewDidLoad()
        regionalCountries = countries
        filteredCountries = regionalCountries
        sortCardView.cornerBorders(radius: cardCornerRadius, corners: [.layerMinXMaxYCorner,.layerMaxXMaxYCorner])
        initializeTextField()
        initializeTableView()
        
        
        sortCollectionView.backgroundColor = .none
        sortCollectionView.delegate = self
        sortCollectionView.dataSource = self
        
        resultsLbl.text = "Results: \(filteredCountries.count)"
        sortHeightConstraint.constant = 0
        sortOptionsBottomConstaint.constant = 0
        
        print("learn:\(countries.count)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let destination = segue.destination as! CountryDetailVC
            destination.currentCountry = detailCountry
        }
    }
    @IBAction func keyStrokeDetectected(_ sender: UITextField) {
        keystroke()
    }
    
    @IBAction func expandSortTapped(sender: UIButton) {
        sortExpanded.toggle()
        var sortHeight: CGFloat = 0
        var cardHeight: CGFloat = 0
        var bottomConst: CGFloat = 0
        if sortExpanded {
            sortHeight = sortExpandedHeight
            cardHeight = cardCollapsedHeight + sortExpandedHeight
            bottomConst = cardCornerRadius
        }
        else {
            sortHeight = sortCollapsedHeight
            cardHeight = cardCollapsedHeight
            bottomConst = 0
        }
        
        UIView.animate(withDuration: 0.5) { [self] in
            sortHeightConstraint.constant = sortHeight
            cardHeightConstraint.constant = cardHeight
            sortOptionsBottomConstaint.constant = bottomConst
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func sortTapped(sender: CustomSortButton) {
        if sender.isSorting {
            sortType = "None"
            sender.isSorting = false
            DispatchQueue.main.async {
                sender.setSelect()
            }
        } else {
            sortType = sender.titleLabel?.text ?? "No val"
            sortBtns.forEach { btn in
            btn.isSorting = false
                DispatchQueue.main.async {
                    btn.setSelect()
                }
            }
            sender.isSorting = true
        }
        sortTypeChanged()
    }
    
    func sortTypeChanged() {
        sortTypeLbl.text = sortType
        regionalCountries.removeAll()
        if sortType == "None" {
            regionalCountries = countries
        } else {
            countries.forEach { country in
                if country.region == sortType {
                    regionalCountries.append(country)
                }
            }
        }
        filteredCountries = regionalCountries
        keystroke()
        searchTextField.resignFirstResponder()
        countriesTableView.reloadData()
    }
    
    func keystroke() {
        guard let text = searchTextField.text else { return }
        filteredCountries.removeAll()
        if text.trimmingCharacters(in: .whitespaces) == "" {
            filteredCountries = regionalCountries
        }
        regionalCountries.forEach { country in
            if country.name.lowercased().contains(text.lowercased()) {
                filteredCountries.append(country)
            }
        }
        DispatchQueue.main.async { [self] in
            resultsLbl.text = "Results: \(filteredCountries.count)"
        }
        countriesTableView.reloadData()
    }
    
    func initializeTableView() {
        countriesTableView.delegate = self
        countriesTableView.dataSource = self
        countriesTableView.separatorStyle = .none
    }
    func initializeTextField() {
        searchTextField.delegate = self
    }
}

extension LearnVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell") as! CountryTVC
        cell.alpha = 0
        cell.country = filteredCountries[indexPath.row]
        cell.configureCell()
        UIView.animate(withDuration: 0.75) {
            cell.alpha = 1
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 5.5
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        detailCountry = filteredCountries[indexPath.row]
        return indexPath
    }
}

extension LearnVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return regions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sortCell", for: indexPath) as! SortCVC
        cell.alpha = 0
        cell.configureCell(title: regions[indexPath.row])
        sortBtns.append(cell.sortBtn)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.size.width / 3) - 2, height: (sortExpandedHeight / 2) - 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}


extension LearnVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}
