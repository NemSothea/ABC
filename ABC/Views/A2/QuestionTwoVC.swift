//
//  QuestionTwoVC.swift
//  ABC
//
//  Created by SotheaNem on 7/27/18.
//  Copyright © 2018 Sothea. All rights reserved.
//

import UIKit

class QuestionTwoVC: UIViewController {
    var data:ExampleModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = data?.QUESTION
    }

    @IBAction func btnbackWasPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
