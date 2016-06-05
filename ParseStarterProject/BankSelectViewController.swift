//
//  BankSelectViewController.swift
//  Skimpi
//
//  Created by Flavio Lici on 5/24/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Alamofire


class BankSelectViewController: UIViewController, PLDLinkNavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func plaidConnect(sender: UIButton) {
        let plaidLink = PLDLinkNavigationViewController(environment: .Tartan, product: .Connect)
        plaidLink.linkDelegate = self
        plaidLink.providesPresentationContextTransitionStyle = true
        plaidLink.definesPresentationContext = true
        plaidLink.modalPresentationStyle = .Custom
        
        
        self.presentViewController(plaidLink, animated: true, completion: nil)
    }
    
    func linkNavigationContoller(navigationController: PLDLinkNavigationViewController!, didFinishWithAccessToken accessToken: String!) {
        print("success \(accessToken)")
        let params = ["client_id": "5714fe3c66710877408cff89",
                      "secret":"9c9a67029c980420ccb5d2aff4f488",
                      "access_token": "\(accessToken)"
        
        ]
        
        Alamofire.request(.POST, "https://tartan.plaid.com/connect/get", parameters: params).authenticate(user: "5714fe3c66710877408cff89", password: "9c9a67029c980420ccb5d2aff4f488").responseJSON { response in
            debugPrint(response)
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
    func linkNavigationControllerDidFinishWithBankNotListed(navigationController: PLDLinkNavigationViewController!) {
        print("Manually enter bank info?")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func linkNavigationControllerDidCancel(navigationController: PLDLinkNavigationViewController!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
