//
//  StockLookupController.swift
//  stock analyst
//
//  Created by youcef bouhafna on 3/22/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import Foundation
import UIKit
class StockLookupController {
    static func stockLookupSearchByName(name: String, completion:(result: StockLookup?) -> Void) {
        if   let url = LookupNetworkController.searchURLByName(name) {
            LookupNetworkController.lookupDataAtURL(url) { (resultData) -> Void in
                guard let resultData = resultData
                    else {
                        print("Error Loading Data")
                        completion(result: nil)
                        return
                }
                do {
                    let stockLookupAnyObject = try NSJSONSerialization.JSONObjectWithData(resultData, options: NSJSONReadingOptions.AllowFragments)
                    if let lookupArray = stockLookupAnyObject as? [[String: AnyObject]], lookupdictionary = lookupArray.first{
                        let stockLookupObject = StockLookup(jsonDictionary: lookupdictionary)
                        
                        completion(result: stockLookupObject)
                        
                    }else {
                        completion(result: nil)
                    }
                } catch {
                    completion(result: nil)
                }
            }
        }else {
         completion(result: nil)
        }
    }
    
        
    
    
    
    
}