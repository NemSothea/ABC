//
//  ExampleViewModel.swift
//  ABC
//
//  Created by SotheaNem on 7/26/18.
//  Copyright © 2018 Sothea. All rights reserved.
//

import Foundation
class ExampleViewModel {
    
    var exampleVM:[ExampleModel]?
    
    func fetchExampleVM(completion:@escaping (NSError?)->Void) {
        DataAccessManager.manager.fetchData { (arr, err) in
            guard let errStatus = err else {
                self.exampleVM = arr
                return completion(nil)
            }
            completion(errStatus)
        }
        
    }
    
    
}
