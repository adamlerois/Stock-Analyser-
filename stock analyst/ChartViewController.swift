//
//  ChartViewController.swift
//  stock analyst
//
//  Created by youcef bouhafna on 4/1/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chartWebPage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func chartWebPage() {
        let url = NSURL(string:"http://dzmobileappacademy.com/stocks-chart/")
        var request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
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
