//
//  ChartViewController.swift
//  stock analyst
//
//  Created by youcef bouhafna on 4/1/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import UIKit
import SafariServices

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
    override func viewDidAppear(animated: Bool) {
        indicator.stopAnimating()
        indicator.hidesWhenStopped = true
    }
    @IBAction func reloadButtonTapped(sender: UIBarButtonItem) {
        self.webView.reload()
    }
    @IBAction func backButtonTapped(sender: AnyObject) {
        self.webView.goBack()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func chartWebPage() {
        let url = NSURL(string:"http://dzmobileappacademy.com/stocks-chart/")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        webView.goBack()
        indicator.startAnimating()
        indicator.backgroundColor = UIColor.init(white: 0.5, alpha: 0.0)
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
