//
//  CurrencyNetworkController.swift
//  stock analyst
//
//  Created by youcef bouhafna on 3/29/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import Foundation
class CurrencyNetworkController {
    static func dataAtURL(url: String, completion: (data: NSData?) -> Void) {
        if let url = NSURL(string: url) {
            let dataTask = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, _, error) in
                if let error = error {
                    print("Error fetching data at \(url). \(error.localizedDescription)")
                    completion(data: nil)
                } else if let data = data {
                    completion(data: data)
                } else {
                    completion(data: nil)
                    print("No data")
                }
            })
            dataTask.resume()
        } else {
            completion(data: nil)
            print("The given url is not a valid url")
        }
    }
    
}