//
//  ChartViewController.swift
//  stock analyst
//
//  Created by youcef bouhafna on 4/1/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    func activityIndicator(){
        indicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 40, 40))
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        
    }
    
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        chartWebPage()
        
       
        
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        indicator.stopAnimating()
        indicator.hidesWhenStopped = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func chartWebPage() {
        let url = NSURL(string:"http://dzmobileappacademy.com/stocks-chart/")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        indicator.startAnimating()
        indicator.backgroundColor = UIColor.whiteColor()
    
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
