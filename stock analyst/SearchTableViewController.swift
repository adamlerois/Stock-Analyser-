//
//  SearchTableViewController.swift
//  stock analyst
//
//  Created by youcef bouhafna on 3/24/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIBarPositioningDelegate, UITextFieldDelegate {
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
    let symbols = ["AAPL", "GOOG", "MSFT", "BRK-A", "XOM", "FB", "JNJ", "GE", "AMZN", "WFC", "T", "PG", "JPM", "VZ", "WMT", "KO", "CVX", "PFE", "V", "ORCL", "HD", "DIS", "INTC", "PM", "INTC", "PM", "PEP", "CMCSA", "MRK", "CSCO", "BAC", "IBM", "C", "GILD", "MO", "UNH", "MCD", "CVS", "AMGN", "NKE", "MDT", "AGN", "BMY", "MA", "MMM", "KHC", "UPS", "SLB", "ABBV", "WBA", "BA", "SBUX"]
    
    var lookup: StockLookup?
    var stockQuote: StockQuote?
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
        tableView.backgroundView = UIImageView(image: UIImage(named: "brickwall.jpg"))
        tableView.reloadData()
        self.searchBar.returnKeyType = UIReturnKeyType.Done
        self.searchBar.delegate = self
        tableView.scrollEnabled = false
        
        
        func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
            self.searchBar.showsCancelButton = true
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
                self.tableView.reloadData()
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
            StockQuoteController.stockQuoteSearchBySymbol(symbolesString) { (stocks) in
                self.stockQuote = stocks
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.performSegueWithIdentifier("toQuoteResult", sender: self)
                })
            }
        } else {
            let index = self.pickerView.selectedRowInComponent(0)
            let companiesString = self.companies[index]
            StockLookupController.stockLookupSearchByName(companiesString, completion: { (result) in
                self.lookup = result
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.performSegueWithIdentifier("toResultIdentifier", sender: self)
                })
            })
        }
    }
    
    // Find button tapped For The Search
    
    @IBAction func findButtonTapped(sender: UIButton) {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            if searchBar.text == "" {
                nameAlert()
            }else {
                let searchText = searchBar.text
                StockLookupController.stockLookupSearchByName(searchText!, completion: { (result) in
                    self.lookup = result
                    dispatch_async(dispatch_get_main_queue(), {
                        self.performSegueWithIdentifier("toResultIdentifier", sender: self)
                        self.tableView.reloadData()
                    })
                })
            }
        }
            
        else {
            if searchBar.text == ""   {
                symbolAlert()
                
            }else {
                let searchText = searchBar.text
                StockQuoteController.stockQuoteSearchBySymbol(searchText!, completion: { (result) in
                    self.stockQuote = result
                    dispatch_async(dispatch_get_main_queue(), {
                        self.performSegueWithIdentifier("toQuoteResult", sender: self)
                        self.tableView.reloadData()
                    })
                })
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
    
    // filtering search bar
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
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
            return self.symbols[row]
        }
    }
    
    /*
     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toQuoteResult" {
            let resultView = segue.destinationViewController as? QuoteResultViewController
            resultView?.stockQuote = self.stockQuote
        } else if segue.identifier == "toResultIdentifier" {
            let resultView = segue.destinationViewController as? LookupResultViewController
            resultView?.companyLookup = self.lookup
        }
    }
    
    
}
