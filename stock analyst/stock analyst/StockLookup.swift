//
//  StockLookup.swift
//  stock analyst
//
//  Created by youcef bouhafna on 3/22/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import Foundation
class StockLookup {
    static let Kname = "Name"
    static let Ksymbol = "Symbol"
    static let Kexchange = "Exchange"
    var name: String
    var symbol: String
    var exchange: String
    init(name: String, symbol: String, exchange: String) {
        self.name = name
        self.symbol = symbol
        self.exchange = exchange
    }
    
    
    init?(jsonDictionary: [String: AnyObject]) {
        self.name = jsonDictionary[StockLookup.Kname] as? String ?? ""
        self.symbol = jsonDictionary[StockLookup.Ksymbol] as? String ?? ""
        self.exchange = jsonDictionary[StockLookup.Kexchange] as? String ?? ""
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
}