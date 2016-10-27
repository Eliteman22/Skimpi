//
//  BankOfAmericaLoginViewController.swift
//  Skimpi
//
//  Created by Flavio Lici on 6/17/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class BankOfAmericaLoginViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(sender: UIButton) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

}
