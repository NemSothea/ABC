//
//  CloseVC.swift
//  ABC
//
//  Created by SotheaNem on 7/24/18.
//  Copyright © 2018 Sothea. All rights reserved.
//

import UIKit

class QuestionOneVC: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var data: ExampleModel?
    
    let dataSource = ["Reading","Listening"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.navigationItem.title = data?.QUESTION
        
        configureCell()
    }
    
    func configureCell() {
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
    }

    @IBAction func btnBackWasPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func settingWasPressed(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "S1", bundle: nil).instantiateViewController(withIdentifier: "s1") as? S1VC {
            let transition = CATransition()
            transition.duration = 0.5
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromRight
            self.navigationController!.view.layer.add(transition, forKey: nil)
            if let nav = navigationController {
                nav.pushViewController(vc, animated: true)
            }
        }
    }
}

extension QuestionOneVC: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard  let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "subjectCell", for: indexPath) as? SubjectCell else { return UICollectionViewCell() }
        
        cell.lblReading.text = dataSource[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            self.calledReading()
        }
        
    }
     private func calledReading() {
        if let vc = UIStoryboard(name: "Reading", bundle: nil).instantiateViewController(withIdentifier: "reading") as? ReadingVC {
            if let nv = navigationController {
                nv.pushViewController(vc, animated: true)
            }
        }
    }
    
}
