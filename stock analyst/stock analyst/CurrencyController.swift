//
//  CurrencyController.swift
//  stock analyst
//
//  Created by youcef bouhafna on 3/29/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import Foundation
import UIKit
class CurrencyController {
    
    static let baseURLString = "http://api.fixer.io/latest?base="
    static func getCurrency(base: String, completion:(currencies: [Currency])-> Void) {
        let searchString = baseURLString + "\(base)"
        
        CurrencyNetworkController.dataAtURL(searchString) { (data) in
            guard let data = data,
                jsonAnyObject = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments),
                jsonDictionary = jsonAnyObject as? [String: AnyObject],
                base = jsonDictionary["base"] as? String,
                ratesDictionary = jsonDictionary["rates"] as? [String: Double] else {
                    print("json could not be serialized from data ")
                    completion(currencies: [])
                    return
            }
            var currencyArray = [Currency]()
            for (currencyUnit, currencyPrice) in ratesDictionary {
                let currency = Currency(base: base,currencyUnit: currencyUnit, currencyPrice: currencyPrice)
                currencyArray.append(currency)
                
            }
            completion(currencies: currencyArray)
        }
    }
}