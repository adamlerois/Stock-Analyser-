//
//  QuoteResultViewController.swift
//  stock analyst
//
//  Created by youcef bouhafna on 3/25/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import UIKit

class QuoteResultViewController: UIViewController {
    
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var changePercentYTD: UILabel!
    @IBOutlet weak var changeYTDLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var msDateLabel: UILabel!
    @IBOutlet weak var marketCapLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var changePercentLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    @IBOutlet weak var lastPriceLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    var stockQuote: StockQuote?

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
