//
//  ViewController.swift
//  TDD-BowlingGame
//
//  Created by HankTseng on 2018/8/25.
//  Copyright © 2018年 HyerTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    let game = Game()
    
    var rollScores: [Score] = []
    
    @IBOutlet weak var mySlider: UISlider!
    
    @IBOutlet weak var rollBtn: UIButton!
    
    @IBOutlet weak var rollTableView: UITableView!
    
    
    
    @IBAction func rollClick(_ sender: UIButton) {
        game.roll(Int(mySlider.value))
        var totalScore = game.score()
        print(totalScore)
        rollScores = game.rollScores
        rollTableView.reloadData()
        rollBtn.isHidden = game.isEnd()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rollScores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreTableViewCell") as! ScoreTableViewCell
        cell.roll.text = String(rollScores[indexPath.row].roll ?? 0)
        cell.score.text = String(rollScores[indexPath.row].rollScore ?? 0)
        if rollScores[indexPath.row].isStrike ?? false {
            cell.firstPins.text = String(rollScores[indexPath.row].firstPins ?? 0)
            cell.secPins.text = "/"
            cell.bonus.text = "Strike!!"
        } else if rollScores[indexPath.row].isSpare ?? false {
            cell.firstPins.text = String(rollScores[indexPath.row].firstPins ?? 0)
            cell.secPins.text = String(rollScores[indexPath.row].secPins ?? 0)
            cell.bonus.text = "Spare"
        } else {
            cell.firstPins.text = String(rollScores[indexPath.row].firstPins ?? 0)
            cell.secPins.text = String(rollScores[indexPath.row].secPins ?? 0)
        }
        if indexPath.row == 9 {
            cell.thirdPins.text = String(rollScores[indexPath.row].thirdPins ?? 0)
        }
        
        return cell
    }
   


}

