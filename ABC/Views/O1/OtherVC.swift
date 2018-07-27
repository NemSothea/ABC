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
    
    var sectionTitle = [0:"Question 1 types",1:"Question 2 types",2:"Other Question types"]
    var rowSectionTitle = [0:["You me"],1:["She me"],2:["She mine"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = data?.QUESTION
        
        configure()
    }
    func configure(){
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
    func PDFViewer(index:IndexPath) {
        
        let indexChange:String = index.row == 0 ? "TOPIKSelfStudyGuideForAllTOPIKLevels" : "TOPIK-IIADVANCEDLEVELGRAMMAR"
        print(indexChange)
        let documentFileURL = Bundle.main.url(forResource: indexChange, withExtension: "pdf")!
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
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (rowSectionTitle[section]?.count)!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {return UITableViewCell()}
        cell.Lbltitle.text = rowSectionTitle[indexPath.section]?[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 25))
        sectionView.backgroundColor = UIColor.black
        
        let sectionName = UILabel(frame: CGRect(x: 5, y: 0, width: tableView.frame.size.width, height: 25))
        sectionName.text = sectionTitle[section]
        sectionName.textColor = UIColor.white
        sectionName.font = UIFont.systemFont(ofSize: 14)
        sectionName.textAlignment = .left
        
        sectionView.addSubview(sectionName)
        return sectionView
    }
    
}






