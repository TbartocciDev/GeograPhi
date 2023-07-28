//
//  GameSectionTVC.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/12/23.
//

import UIKit

class GameSectionTVC: UITableViewCell {
    @IBOutlet weak var regionNameLbl: UILabel!
    @IBOutlet weak var gamesTableView: UITableView!
    
    var games: [String] = []
    var gameoffsets: [CGFloat] = []
    
    func configureCell(title: String, offsets: [CGFloat], bgColor: UIColor) {
        gamesTableView.delegate = self
        gamesTableView.dataSource = self
        gamesTableView.backgroundColor = bgColor
        gamesTableView.separatorStyle = .none
        
//        let levels: [Level] = [
//            Level(title: "Intro to \(title)", countries: <#T##[Country]#>, gameType: <#T##String#>)
//        ]
        
        regionNameLbl.text = title
        gameoffsets = offsets
    }
}

extension GameSectionTVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell") as! GameTVC
        if indexPath.row == 0 {
            cell.isLocked = false
        } else if indexPath.row == 1 {
            cell.isLocked = false
        } else if indexPath.row == 2 {
            cell.isLocked = false
        }
        cell.configureCell(distance: gameoffsets[indexPath.row] * 20, levelNum: "\(indexPath.row+1)")
        cell.indexNum = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / CGFloat(games.count)
    }
}
