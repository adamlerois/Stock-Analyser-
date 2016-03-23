//
//  NetworkController.swift
//  stock analyst
//
//  Created by youcef bouhafna on 3/22/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import Foundation
class LookupNetworkController {
    
    static let lookupBaseURL = "http://dev.markitondemand.com/MODApis/Api/v2/Lookup/json?input="
    static func searchURLByName(name: String) -> NSURL {
        return NSURL(string: lookupBaseURL + "\(name)")!
    }

    static func dataAtURL(url: NSURL, completion:(resultData: NSData?) -> Void) {
        let session = NSURLSession.sharedSession()
    
        // create data task and returns the data at the url path
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