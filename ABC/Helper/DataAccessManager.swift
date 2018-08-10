//
//  DataAccessManager.swift
//  ABC
//
//  Created by SotheaNem on 7/26/18.
//  Copyright © 2018 Sothea. All rights reserved.
//

import Foundation

class DataAccessManager {
    
    typealias completionHandler = (_ data:[ExampleModel]?, _ error: NSError?) -> ()
    
    typealias completionHandleQuestion = (_ data:[Question_1]?,_ error: NSError?) -> ()
    
    static let manager = DataAccessManager()
    private init(){}
    
    func fetchData(completion:@escaping completionHandler) {
        guard let jsonPath = Bundle.main.path(forResource: "Example", ofType: "json") else {
            let jsonNotFoundError = NSError(domain: "client error", code: 404, userInfo: [NSLocalizedDescriptionKey:"JSON file not found!"])
            return completion(nil,jsonNotFoundError)
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: jsonPath),options:.mappedIfSafe)
            let response = try JSONDecoder().decode([ExampleModel].self, from: data)
            print("Response:",response)
            completion(response,nil)
        }catch let err as NSError {
            completion(nil,err)
        }
    }
    
    func fetchDataQuestions(completion:@escaping completionHandleQuestion) {
        guard let jsonPath = Bundle.main.path(forResource: "question_type_1", ofType: "json") else {
            let jsonNotFoundError = NSError(domain: "client error", code: 404, userInfo: [NSLocalizedDescriptionKey:"JSON file not found!"])
            return completion(nil,jsonNotFoundError)
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: jsonPath),options:.mappedIfSafe)
            let response = try JSONDecoder().decode([Question_1].self, from: data)
            print("Response:",response)
            completion(response,nil)
        }catch let err as NSError {
            completion(nil,err)
        }
    }
    
    
    

}
