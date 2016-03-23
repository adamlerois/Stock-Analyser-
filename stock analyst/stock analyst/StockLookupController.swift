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
        let url = LookupNetworkController.searchURLByName(name)
        LookupNetworkController.dataAtURL(url) { (resultData) -> Void in
            guard let resultData = resultData
            else {
                print("Error Loading Data")
                completion(result: nil)
                return
            }
            do {
                let stockLookupAnyObject = try NSJSONSerialization.JSONObjectWithData(resultData, options: NSJSONReadingOptions.AllowFragments)
                var stockLookupObject: StockLookup?
                if let lookupdictionary = stockLookupAnyObject as? [String: AnyObject] {
                    stockLookupObject = StockLookup(jsonDictionary: lookupdictionary)
                }
                completion(result: stockLookupObject)
            } catch {
                completion(result: nil)
            }
        }
    }
}