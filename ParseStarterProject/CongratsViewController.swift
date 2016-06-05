//
//  CongratsViewController.swift
//  Skimpi
//
//  Created by Flavio Lici on 6/5/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class CongratsViewController: UIViewController {
    
    var skimperClass: String!
    
    @IBOutlet weak var nameOfClass: UILabel!
    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var finishButton: UIButton!
    
    @IBOutlet weak var desc: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PFUser.currentUser()?.setObject(skimperClass, forKey: "skimperClass")
        PFUser.currentUser()?.saveInBackground()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func finishSignup(sender: UIButton) {
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        if skimperClass == "Casual Skimper" {
            nameOfClass.text = "Casual Skimper"
            finishButton.setImage(UIImage(named: "FinishCasual"), forState: .Normal)
            background.image = UIImage(named: "CasualBackground")
            desc.image = UIImage(named: "CongratsCasual")
            
        } else if skimperClass == "Super Skimper" {
            nameOfClass.text = "Super Skimper"
            finishButton.setImage(UIImage(named: "FinishSuper"), forState: .Normal)
            background.image = UIImage(named: "SuperBackground")
            desc.image = UIImage(named: "CongratsSuper")
            
        } else if skimperClass == "Hardcore Skimper" {
            nameOfClass.text = "Hardcore Skimper"
            finishButton.setImage(UIImage(named: "FinishHardcore"), forState: .Normal)
            background.image = UIImage(named: "HardcoreBackground")
            desc.image = UIImage(named: "CongratsHardcore")
            
        }
    }
}
