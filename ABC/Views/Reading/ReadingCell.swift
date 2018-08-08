//
//  ReadingCell.swift
//  ABC
//
//  Created by SotheaNem on 8/8/18.
//  Copyright © 2018 Sothea. All rights reserved.
//

import UIKit

class ReadingCell: UITableViewCell {

    @IBOutlet weak var QuestionNumber: UILabel!
    @IBOutlet weak var Questions: UILabel!
    @IBOutlet weak var answerKey_1: UIButton!
    @IBOutlet weak var answerKey_2: UIButton!
    @IBOutlet weak var answerKey_3: UIButton!
    @IBOutlet weak var answerKey_4: UIButton!
    @IBOutlet weak var imgCrile: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
     
       
    }
    @objc func gestureAction() {
        if answerKey_1.isSelected {
            imgCrile.image = UIImage(named: "list_main_check_off")
        }else {
            imgCrile.image = UIImage(named: "list_main_check_on")
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
    }

}
