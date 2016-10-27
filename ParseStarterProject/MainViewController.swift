//
//  MainViewController.swift
//  Skimpi
//
//  Created by Flavio Lici on 6/5/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var cashBalance: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        
        if let path = NSBundle.mainBundle().pathForResource("transactions", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    if let accounts : [NSDictionary] = jsonResult["accounts"] as? [NSDictionary] {
                        var totalCash = 0
                        for account: NSDictionary in accounts {
                            var balance = account["balance"]
                            var cash = balance!["current"]
                            totalCash += cash as! Int
                        }
                        cashBalance.text = "$\(totalCash)"
                    }
                } catch {}
            } catch {}
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
