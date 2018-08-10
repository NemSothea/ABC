//
//  ReadingVC.swift
//  ABC
//
//  Created by SotheaNem on 8/7/18.
//  Copyright © 2018 Sothea. All rights reserved.
//

import UIKit

class ReadingVC: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
extension ReadingVC: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            guard let cell = myTableView.dequeueReusableCell(withIdentifier: "ReadingCellOne") as? ReadingCell else {return UITableViewCell()}
            
            return cell
        
       
    }
    
    
    
    
    
    
}
