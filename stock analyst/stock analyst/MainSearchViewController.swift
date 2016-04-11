//
//  MainSearchViewController.swift
//  stock analyst
//
//  Created by youcef bouhafna on 4/5/16.
//  Copyright © 2016 Youcef. All rights reserved.
//


//
//  SearchTableViewController.swift
//  stock analyst
//
//  Created by youcef bouhafna on 3/24/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import UIKit

class MainSearchViewController: UIViewController, UISearchBarDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIBarPositioningDelegate, UITextFieldDelegate {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    enum SegmentedControlViewMode: Int {
        case Lookup = 0
        case Quote = 1
    }
    var viewMode: SegmentedControlViewMode {
        return SegmentedControlViewMode(rawValue: segmentedControl.selectedSegmentIndex)!
    }
    
    
    //MARK: - properties
    let companies = ["Apple", "Alphabet Inc", "Microsoft", "Berkshire Hathaway", "Exxon Mobil", "Facebook", "Johnson & Johnson", "General Electric", "Amazon", "Wells Fargo", "AT&T", " Procter & Gamble", "JPMorgan Chase", "Verizon Communications", "Wal-Mart", "Coca-Cola", "Chevron", "Pfizer", "Visa", "Oracle", "Home Depot", "Disney", "Intel", "Philip Morris International", "PepsiCo", "Comcast", "Merck", "Cisco Systems", "Bank Of America", "IBM", "Citigroup", "Gilead Sciences", "Altria", "UnitedHealth Group", "McDonald's", "CVS Health", "Amgen", "NIKE Inc", "Medtronic", "Allergan", "Bristol-Myers Squibb", "Mastercard Inc", "3M", "Kraft Heinz Co", "United Parcel Service", "Schlumberger", "AbbVie Inc", "Walgreens Boots Alliance", "Boeing", "Starbucks Corp"]
    let symbols = ["AAPL", "GOOG", "MSFT", "BRK.A", "XOM", "FB", "JNJ", "GE", "AMZN", "WFC", "T", "PG", "JPM", "VZ", "WMT", "KO", "CVX", "PFE", "V", "ORCL", "HD", "DIS", "INTC", "PM", "PEP", "CMCSA", "MRK", "CSCO", "BAC", "IBM", "C", "GILD", "MO", "UNH", "MCD", "CVS", "AMGN", "NKE", "MDT", "AGN", "BMY", "MA", "MMM", "KHC", "UPS", "SLB", "ABBV", "WBA", "BA", "SBUX"]
    
    var lookup: StockLookup?
    var stockQuote: StockQuote?
    var companyName: String?
    var inSearchMode = false
    var stockLookupArray : [StockLookup] = []
    var stockQuoteArray: [StockQuote] = []
    
    
    var names: [StockLookup] = []
    var symbolarray: [StockQuote] = []
    var lookupFilteredArray: [StockLookup] = []
    var QuoteFilteredArray: [StockQuote] = []
    
    // Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var pickupLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(symbols.count)
        print(companies.count)
        
        self.searchBar.returnKeyType = UIReturnKeyType.Done
        
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            
        } else {
            inSearchMode = true
            if segmentedControl.selectedSegmentIndex == 0 {
                let string = searchBar.text!
                lookupFilteredArray = stockLookupArray.filter({$0.name.rangeOfString(string) != nil})
            } else {
                let symbolString = searchBar.text!
                QuoteFilteredArray = stockQuoteArray.filter({$0.symbol.rangeOfString(symbolString) != nil})
            }
        }
    }
    
    
    
    // functions
    
    @IBAction func segmentedValueChanged(sender: UISegmentedControl) {
        updateViewMode()
    }
    
    // Go Button Tapped for the PickerView
    
    @IBAction func goButtonTapped() {
        if segmentedControl.selectedSegmentIndex == 1 {
            let index = self.pickerView.selectedRowInComponent(0)
            let symbolesString = self.symbols[index]
            companyName = symbolesString
            //            StockQuoteController.stockQuoteSearchBySymbol(symbolesString) { (stocks) in
            //                self.stockQuote = stocks
            //                dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.performSegueWithIdentifier("toQuoteResult", sender: self)
            //                })
            //            }
        } else {
            let index = self.pickerView.selectedRowInComponent(0)
            let companiesString = self.companies[index]
            companyName = companiesString
            //            StockLookupController.stockLookupSearchByName(companiesString, completion: { (result) in
            //                self.lookup = result
            //
            //                dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.performSegueWithIdentifier("toResultIdentifier", sender: self)
            //                })
            //            })
        }
    }
    
    // Find button tapped For The Search
    
    @IBAction func findButtonTapped(sender: UIButton) {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            if searchBar.text == "" {
                nameAlert()
            }else {
                let searchText = searchBar.text
                companyName = searchText
//                StockLookupController.stockLookupSearchByName(searchText!, completion: { (result) in
//                    self.lookup = result
//                    dispatch_async(dispatch_get_main_queue(), {
                        self.performSegueWithIdentifier("toResultIdentifier", sender: self)
//                    })
//                })
            }
        }
            
        else {
            if searchBar.text == ""   {
                symbolAlert()
                
            }else {
                let searchText = searchBar.text
                companyName = searchText
//                StockQuoteController.stockQuoteSearchBySymbol(searchText!, completion: { (result) in
//                    self.stockQuote = result
//                    dispatch_async(dispatch_get_main_queue(), {
                        self.performSegueWithIdentifier("toQuoteResult", sender: self)
//                    })
//                })
            }
            
            self.searchBar.endEditing(true)
        }
    }
    
    func updateViewMode() {
        if segmentedControl.selectedSegmentIndex == 0 {
            searchBar.placeholder = "Type Company Name... example: Apple"
            pickupLabel.text = "OR Pick Up A Company "
            pickerView.reloadAllComponents()
        } else {
            searchBar.placeholder = "Type Symbol... example: AAPL"
            pickupLabel.text = "OR Pick Up A Ticker Symbol"
            pickerView.reloadAllComponents()
        }
    }
    
    // alerts
    
    func symbolAlert() {
        let symbolAlert = UIAlertController(title: "Error", message: "Please Put A Valid Symbol", preferredStyle: .Alert)
        symbolAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(symbolAlert, animated: true, completion: nil)
    }
    func nameAlert() {
        let alert = UIAlertController(title: "Error", message: "Please Put A Valid Name", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    //MARK: - UIPickerView Protocol Methods
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return companies.count
        } else {
            return symbols.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if segmentedControl.selectedSegmentIndex == 0 {
            return self.companies[row]
        } else  {
            return "\(symbols[row]) - \(companies[row])"
        }
    }
    
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toQuoteResult" {
            let resultView = segue.destinationViewController as? QuoteResultViewController
            //            resultView?.stockQuote = self.stockQuote
            resultView?.companyName = companyName
        } else if segue.identifier == "toResultIdentifier" {
            let resultView = segue.destinationViewController as? LookupResultViewController
            //            resultView?.companyLookup = self.lookup
            resultView?.companyName = companyName
        }
    }
}
