//
//  OtherVC.swift
//  ABC
//
//  Created by SotheaNem on 7/27/18.
//  Copyright © 2018 Sothea. All rights reserved.
//

import UIKit
import PDFReader

class OtherVC: UIViewController {
    var data:ExampleModel?
    
    @IBOutlet weak var myTableView: UITableView!
    
    let dataSource = [
        [
            "title": "Question 1 types",
            "arr" : [
                ["sub" : "You me", "book" : "TOPIKSelfStudyGuideForAllTOPIKLevels"],
                ["sub" : "Vansa", "book" : "TOPIK-IIADVANCEDLEVELGRAMMAR"]
            ]
        ],
        [
            "title": "Question 2 types",
            "arr" : [
                ["sub" : "She me", "book" : "TOPIK-IIADVANCEDLEVELGRAMMAR"]
            ]
        ],
        [
            "title": "Question 3 types",
            "arr" : [
                ["sub" : "She mine", "book" : "TOPIKSelfStudyGuideForAllTOPIKLevels"]
            ]
        ],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = data?.QUESTION
        
        configure()
    }
    func configure(){
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
    func PDFViewer(ip: IndexPath) {
        guard let file = dataSource[ip.section]["arr"] as? Array<Dictionary<String, String>> else { return }
        let bookTitle = file[ip.row]["book"]
        let documentFileURL = Bundle.main.url(forResource: bookTitle, withExtension: "pdf")!
        let document = PDFDocument(url: documentFileURL)!
        let readerController = PDFViewController.createNew(with: document)
        navigationController?.pushViewController(readerController, animated: true)
    }

    @IBAction func btnbackWasPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension OtherVC: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberSection = dataSource[section]["arr"] as? Array<Dictionary<String, String>> else { return 0 }
        return numberSection.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {return UITableViewCell()}
        guard let data = dataSource[indexPath.section]["arr"] as? Array<Dictionary<String, String>> else {return UITableViewCell()}
        cell.Lbltitle.text = data[indexPath.row]["sub"]
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        PDFViewer(ip: indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 25))
        sectionView.backgroundColor = UIColor.black
        
        let sectionName = UILabel(frame: CGRect(x: 5, y: 0, width: tableView.frame.size.width, height: 25))
        sectionName.text = dataSource[section]["title"] as? String ?? ""
        sectionName.textColor = UIColor.white
        sectionName.font = UIFont.systemFont(ofSize: 14)
        sectionName.textAlignment = .left
        
        sectionView.addSubview(sectionName)
        return sectionView
    }
    
}






