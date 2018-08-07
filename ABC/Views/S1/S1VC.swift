//
//  S1VC.swift
//  ABC
//
//  Created by SotheaNem on 8/3/18.
//  Copyright © 2018 Sothea. All rights reserved.
//

import UIKit

class S1VC: UIViewController {
    
    let imageSlide:UIImageView = {
        let imageIcon = UIImageView(image: #imageLiteral(resourceName: "programmer"))
            imageIcon.translatesAutoresizingMaskIntoConstraints = false
            imageIcon.layer.masksToBounds = true
            imageIcon.clipsToBounds = true
            imageIcon.layer.cornerRadius = 50.0
            imageIcon.layer.borderWidth = 2.0
            imageIcon.layer.borderColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        return imageIcon
    }()
    
    let decriptionText:UITextView = {
        let textView = UITextView()
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.text = "Hello Text I need you."
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageSlide)
        view.addSubview(decriptionText)
        setLayout()
 
    }
  
    private func setLayout() {
        
        imageSlide.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageSlide.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        imageSlide.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageSlide.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        decriptionText.topAnchor.constraint(equalTo: imageSlide.bottomAnchor, constant: 200).isActive = true
        decriptionText.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        decriptionText.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        decriptionText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = false
        
      
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
