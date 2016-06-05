//
//  BadgesViewController.swift
//  Skimpi
//
//  Created by Flavio Lici on 6/5/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class BadgesViewController: UIViewController {

    @IBOutlet weak var blackOverlay: UIView!
    
    @IBOutlet weak var popup: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popup.alpha = 0
        popup.layer.cornerRadius = 10
        popup.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func moreBadgeInfo(sender: UIButton) {
        if sender.tag == 1 {
            
        }
    }

   
    func openCongrats() {
        UIView.animateWithDuration(0.5, animations: {
            self.blackOverlay.alpha = 0.6
        })
        UIView.animateWithDuration(0.5, animations: {
            self.popup.alpha = 1
        })
        
    }
}
