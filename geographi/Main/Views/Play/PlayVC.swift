//
//  PlayVC.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/3/23.
//

import UIKit

class PlayVC: UIViewController {
    @IBOutlet weak var gamesTableView: UITableView!
    
    var countries: [Country] = []
    var regions: [String] = []
    
    let gameOffsets: [[CGFloat]] = [
        [0,1,2,1,0,-1,-2,-3],
        [-3,-2,-1,0,1,2,1,0],
        [0,6,-6,6,-6,6,-6,0],
        [0,3,-1,-3,0,2,-2,-3],
        [-3,-2,-1,0,1,2,1,0],
        [0,-1,-2,-1,0,1,1,0],
        [0,0,0,0,0,0,0,0]
    ]
    
    let colors: [String] = ["Autumn Orange","Hot Pink","Autumn Orange","Hot Pink","Autumn Orange","Hot Pink","Autumn Orange","Hot Pink","Autumn Orange","Hot Pink"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gamesTableView.dataSource = self
        gamesTableView.delegate = self
        gamesTableView.separatorStyle = .none
        
        print("Play")
    }
   

}

extension PlayVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "regionCell") as! GameSectionTVC
        cell.configureCell(
            title: regions[indexPath.row],
            offsets: gameOffsets[indexPath.row],
            bgColor: UIColor(named: colors[indexPath.row]) ?? UIColor.white
        )
        cell.games = ["Flag", "capitals", "Fun","Hard","Flag", "capitals", "Fun","Hard"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height
    }
}
