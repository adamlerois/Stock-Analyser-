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
    static let baseURLString = "http://api.fixer.io/latest?base=USA"
    static func getCurrencyWithSearchTerm(searchTerm: String, completion:(currencies: Currency?)-> Void) {
        
        
      CurrencyNetworkController.dataAtURL(baseURLString) { (data) in
        guard let data = data,
            jsonDictionary = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) else {
                print("json could not be serialized from data ")
                completion(currencies: nil)
                return
        }
        var currencyObject: Currency?
        if let ResultDictionary = jsonDictionary as? [String: AnyObject] {
            currencyObject = Currency(jsonDictionary: ResultDictionary)
        }
        completion(currencies: currencyObject)
    }
}
}