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
    static func searchURLBySymbol(symbol: String) -> NSURL? {
        let searchString = quoteBaseURL + "\(symbol)"
        let spaceHandling = searchString.stringByReplacingOccurrencesOfString(" ", withString: "+")
        if let url = NSURL(string: spaceHandling) {
            return url
        } else {
            return nil
        }
    }

    static func quoteDataAtURL(url: NSURL, completion:(resultData: NSData?) -> Void) {
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            guard let data = data else {
                print(error?.localizedDescription)
                return
            }
            completion(resultData: data)
        }
        dataTask.resume()
    }
}