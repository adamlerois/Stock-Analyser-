//
//  StockQuoteController.swift
//  stock analyst
//
//  Created by youcef bouhafna on 3/22/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import Foundation
import UIKit
class StockQuoteController {
    static func stockQuoteSearchBySymbol(symbol: String, completion:(result: StockQuote?) -> Void) {
        let url = QuoteNetworkController.searchURLBySymbol(symbol)
        QuoteNetworkController.quoteDataAtURL(url) { (resultData) -> Void in
            guard let resultData = resultData else {
                print("Error Loading Data")
                completion(result: nil)
                return
            }
            do {
                let stockQuoteAnyObject = try NSJSONSerialization.JSONObjectWithData(resultData, options: NSJSONReadingOptions.AllowFragments)
                var stockQuoteObject: StockQuote?
                if let quoteDictionary = stockQuoteAnyObject as? [String: AnyObject] {
                    stockQuoteObject = StockQuote(jsonDictionary: quoteDictionary)
                }
                completion(result: stockQuoteObject)
            } catch {
                completion(result: nil)
            }
        }
    }
}