//
//  TableViewCell.swift
//  ABC
//
//  Created by SotheaNem on 7/27/18.
//  Copyright © 2018 Sothea. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var Lbltitle: UILabel!
    @IBOutlet weak var btnRead: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
