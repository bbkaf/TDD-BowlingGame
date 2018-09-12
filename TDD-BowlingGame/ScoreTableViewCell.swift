//
//  ScoreTableViewCell.swift
//  TDD-BowlingGame
//
//  Created by HankTseng on 2018/9/13.
//  Copyright © 2018 HyerTech. All rights reserved.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {

    @IBOutlet weak var roll: UILabel!
    
    @IBOutlet weak var firstPins: UILabel!
    
    @IBOutlet weak var secPins: UILabel!
    
    @IBOutlet weak var thirdPins: UILabel!
    
    @IBOutlet weak var bonus: UILabel!
    
    @IBOutlet weak var score: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
