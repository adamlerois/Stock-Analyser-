//
//  StockQuote.swift
//  stock analyst
//
//  Created by youcef bouhafna on 3/22/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import Foundation
import UIKit
class StockQuote {
    static let Kstatus = "Status"
    static let Kname = "Name"
    static let Ksymbol = "Symbol"
    static let KlastPrice = "LastPrice"
    static let Kchange = "Change"
    static let KchangePercent = "ChangePercent"
    static let KtimeStamp = "TimeStamp"
    static let KmsDate = "MSDate"
    static let KmarketCap = "MarketCap"
    static let Kvolume = "Volume"
    static let KchangeYTD = "ChangeYTD"
    static let KchangePercentYTD = "ChangePercentYTD"
    static let Khigh = "High"
    static let Klow = "Low"
    static let Kopen = "Open"
    
    
    var status: String
    var name: String
    var symbol: String
    var lastPrice: Double
    var change: Double
    var changePercent: Double
    var timeStamp: String
    var msDate: Double
    var marketCap: Double
    var volume: Double
    var changeYTD: Double
    var changePercentYTD: Double
    var high: Double
    var low: Double
    var open: Double
    
//    init(status: String, name: String, symbol: String, lastPrice: Double, change: Double, changePercent: Double, timeStamp: String, msDate: Double, marketCap: Double, volume: Double, changeYTD: Double, changePercentYTD: Double, high: Double, low: Double, open: Double) {
//        self.status = status
//        self.name = name
//        self.symbol = symbol
//        self.lastPrice = lastPrice
//        self.change = change
//        self.timeStamp = timeStamp
//        self.msDate = msDate
//        self.marketCap = marketCap
//        self.volume = volume
//        self.changeYTD = changeYTD
//        self.changePercentYTD = changePercentYTD
//        self.high = high
//        self.low = low
//        self.open = open
//        self.changePercent = changePercent
//    }
    init?(jsonDictionary: [String: AnyObject]) {
        
        self.name = jsonDictionary[StockQuote.Kname] as? String ?? ""
        self.status = jsonDictionary[StockQuote.Kstatus] as? String ?? ""
        self.symbol = jsonDictionary[StockQuote.Ksymbol] as? String ?? ""
        self.lastPrice = jsonDictionary[StockQuote.KlastPrice] as? Double ?? 0.0
        self.change = jsonDictionary[StockQuote.Kchange] as? Double ?? 0.0
        self.timeStamp = jsonDictionary[StockQuote.KtimeStamp] as? String ?? ""
        self.msDate = jsonDictionary[StockQuote.KmsDate] as? Double ?? 0.0
        self.marketCap = jsonDictionary[StockQuote.KmarketCap] as? Double ?? 0.0
        self.volume = jsonDictionary[StockQuote.Kvolume] as? Double ?? 0.0
        self.changeYTD = jsonDictionary[StockQuote.KchangeYTD] as? Double ?? 0.0
        self.changePercentYTD = jsonDictionary[StockQuote.KchangePercentYTD] as? Double ?? 0.0
        self.high = jsonDictionary[StockQuote.Khigh] as? Double ?? 0.0
        self.low = jsonDictionary[StockQuote.Klow] as? Double ?? 0.0
        self.open = jsonDictionary[StockQuote.Kopen] as? Double ?? 0.0
        self.changePercent = jsonDictionary[StockQuote.KchangePercent] as? Double ?? 0.0
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
}
