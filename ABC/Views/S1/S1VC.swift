//
//  S1VC.swift
//  ABC
//
//  Created by SotheaNem on 8/3/18.
//  Copyright © 2018 Sothea. All rights reserved.
//

import UIKit

class S1VC: UIViewController {
    
    let colorView = UIView()
    let lblCenter = UILabel()
    
    var initialConstains = [NSLayoutConstraint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createColorView()
        self.view.addSubview(lblCenter)
        createLabel()
        // Do any additional setup after loading the view.
    }
    func createLabel() {
        
        lblCenter.translatesAutoresizingMaskIntoConstraints = false
        lblCenter.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        lblCenter.textColor = UIColor.black
        lblCenter.text = "I love yo😍u "
        lblCenter.font = UIFont.systemFont(ofSize: 18)
        NSLayoutConstraint.activate([
            lblCenter.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblCenter.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            lblCenter.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7),
            lblCenter.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        
    }
    func createColorView() {
        
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.backgroundColor = UIColor.gray
        self.view.addSubview(colorView)
        
     
        
        
        let leadingContraint = colorView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstaint = colorView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let topConstaint = colorView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let bottomContraint = colorView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        initialConstains.append(contentsOf: [leadingContraint,trailingConstaint,topConstaint,bottomContraint])
        NSLayoutConstraint.activate(initialConstains)
        
    }


}
extension UIView {
    
    func subViews<T :UIView>(type:T.Type)->[T] {
        var all = [T]()
        func getSubview(view:UIView) {
            for view in self.subviews {
                if let aView = view as? T {
                    all.append(aView)
                }
            }
        }
        return all
    }
    
    func allSubViewOf<T:UIView>(type: T.Type)->[T] {
        var all = [T]()
        func getSubView(view:UIView) {
            if let aView = view as? T {
                all.append(aView)
            }
            guard view.subviews.count>0 else {return}
            view.subviews.forEach({getSubView(view: $0)})
        }
        getSubView(view: self)
        return all
    }
}
