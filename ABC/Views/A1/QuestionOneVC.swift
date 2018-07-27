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
    
}

extension QuestionOneVC: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard  let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath) as? ReadingCell else { return UICollectionViewCell() }
        
        return cell
    }
    
}
