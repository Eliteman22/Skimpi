//
//  PNCLoginViewController.swift
//  Skimpi
//
//  Created by Flavio Lici on 6/23/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class PNCLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.tabBar.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func back(sender: UIButton) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }


}
