//
//  QuoteNetworkController.swift
//  stock analyst
//
//  Created by youcef bouhafna on 3/22/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import Foundation

class QuoteNetworkController {
    static let quoteBaseURL = "http://dev.markitondemand.com/MODApis/Api/v2/Quote/json?symbol="
    static func searchURLBySymbol(symbol: String) -> NSURL {
        return NSURL(string: quoteBaseURL + "\(symbol)")!
    
    }
    static func quoteDataAtURL(url: NSURL, completion:(resultData: NSData?) -> Void) {
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            guard let data = data else {
                print(error?.localizedDescription)
                completion(resultData: nil)
                return
            }
            completion(resultData: data)
        }
        dataTask.resume()
    }
}