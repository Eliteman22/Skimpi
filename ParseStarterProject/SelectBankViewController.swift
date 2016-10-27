//
//  SelectBankViewController.swift
//  Skimpi
//
//  Created by Flavio Lici on 6/2/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse
import Alamofire

class SelectBankViewController: UIViewController {
    
    @IBOutlet weak var continueButton: UIButton!
    
    var bankName: String!
    
    @IBOutlet weak var bankUsername: UITextField!
    
    @IBOutlet weak var bankPassword: UITextField!
    
    
    @IBOutlet weak var nameOfBank: UILabel!
    
    
    
    
    
    var authHeader = ["":""]
    var cobSess: String!
    var userSess: String!
    var selectedBankId: String!
    
    @IBOutlet weak var blackoutScreen: UIView!
    
    @IBOutlet weak var loginScreen: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        UIStatusBarStyle.LightContent
   
        self.navigationController?.navigationBarHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
    
    @IBAction func back(sender: UIButton) {
        bankName = ""
        UIView.animateWithDuration(0.5, animations: {
            self.blackoutScreen.alpha = 0
            self.loginScreen.alpha = 0
        })
    }
    
    
    
    func displayAlert(title: String, message: String) {
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: {
            (action) -> Void in
            
            
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
}
