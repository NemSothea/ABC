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
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            guard let cell = myTableView.dequeueReusableCell(withIdentifier: "ReadingCellOne") as? ReadingCell else {return UITableViewCell()}
//            cell.answerKey_1.addTarget(self, action: #selector(ReadingVC.checkSelectedKeyOne), for: .touchUpInside)
//            cell.answerKey_2.addTarget(self, action: #selector(ReadingVC.checkSelectedKeyOne), for: .touchUpInside)
            cell.shareButtons.forEach { (btn) in
                btn.addTarget(self, action: #selector(ReadingVC.checkSelectedKeyOne), for: .touchUpInside)
            }
            return cell
        }else {
            guard let cell = myTableView.dequeueReusableCell(withIdentifier: "ReadingCellTwo") as? ReadingImageCell else {return UITableViewCell()}
            
            return cell
        }
    }
    
    @objc func checkSelectedKeyOne(_ sender: UIButton) {
        
        print(sender.tag)
        let cell : ReadingCell = myTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! ReadingCell
        cell.shareButtons.forEach {
            $0.isSelected = false
        }
        sender.isSelected = !sender.isSelected
        
        
        
//        if let button = sender as? UIButton {
//            if button.tag == 101 {
//                    isSelectedBtn = false
//                if button.isSelected {
//                    button.setImage(UIImage(named: "number-one-black"), for: UIControlState.normal)
//
//                }else {
//                     button.setImage(UIImage(named: "number-one"), for: UIControlState.normal)
//                }
//
//            }else if button.tag == 102 {
//                if button.isSelected {
//                    button.setImage(UIImage(named: "number-two-black"), for: UIControlState.normal)
//
//                }else {
//                    button.setImage(UIImage(named: "number-two"), for: UIControlState.normal)
//                }
//
//            }//else
//
//        }
    }
    
}
