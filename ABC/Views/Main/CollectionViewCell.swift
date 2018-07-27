//
//  CollectionViewCell.swift
//  ABC
//
//  Created by SotheaNem on 7/26/18.
//  Copyright © 2018 Sothea. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var Lbltitle: UILabel!
    func configurCell(model: ExampleModel){
        Lbltitle.text = model.QUESTION
    }
}
