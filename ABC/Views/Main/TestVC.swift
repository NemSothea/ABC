//
//  ViewController.swift
//  ABC
//
//  Created by SotheaNem on 7/24/18.
//  Copyright © 2018 Sothea. All rights reserved.
//

import UIKit

class TestVC: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    let exam = ExampleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        
       
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchDataExample()
    }
    private func fetchDataExample() {
        exam.fetchExampleVM { (error) in
            if error != nil {
                guard let errorMessage = error?.localizedDescription else { return }
                self.alertMessageWithoutAction(title: nil, message: errorMessage)
            }else {
                self.myCollectionView.reloadData()
            }
        }
    }
    
    
}
extension TestVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let numberOfExam  = exam.exampleVM?.count else { return 0}
        return numberOfExam
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for:indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        if let examList = exam.exampleVM {
            let model = examList[indexPath.row]
            cell.configurCell(model: model)
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let example = exam.exampleVM![indexPath.row]
        if indexPath.row == 0  {
            if let vc = UIStoryboard(name: "A1", bundle: nil).instantiateViewController(withIdentifier: "a1") as? QuestionOneVC {
                vc.data = example as ExampleModel
                if let nav = navigationController {
                    nav.pushViewController(vc, animated: true)
                }
            }
        }else if indexPath.row == 1 {
            if let vc = UIStoryboard(name: "A2", bundle: nil).instantiateViewController(withIdentifier: "a2") as? QuestionTwoVC {
                vc.data = example as ExampleModel
                if let nav = navigationController {
                    nav.pushViewController(vc, animated: true)
                }
            }
        }else {
            if let vc = UIStoryboard(name: "O1", bundle: nil).instantiateViewController(withIdentifier: "o1") as? OtherVC {
                vc.data = example as ExampleModel
                if let nav = navigationController {
                    nav.pushViewController(vc, animated: true)
                }
            }
        }
        
    }
    
}

