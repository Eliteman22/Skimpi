//
//  WellsFargoLoginViewController.swift
//  Skimpi
//
//  Created by Flavio Lici on 6/23/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class WellsFargoLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func back(sender: UIButton) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    

}
