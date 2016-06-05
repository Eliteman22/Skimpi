//
//  SpenderQuizViewController.swift
//  Skimpi
//
//  Created by Flavio Lici on 6/4/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class SpenderQuizViewController: UIViewController {
    
    var question1Answered: Bool!
    var question2Answered: Bool!
    var question3Answered: Bool!
    var question4Answered: Bool!
    
    var skimperStatus: String!
    
    var skimperPoints: Int!
    
    
    @IBOutlet weak var submitButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        skimperPoints = 0
        submitButton.alpha = 0
        question1Answered = false
        question2Answered = false
        question3Answered = false
        question4Answered = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func age(sender: UIButton) {
        if sender.tag == 1 {
            skimperPoints = skimperPoints + 2
        } else if sender.tag == 2 {
            skimperPoints = skimperPoints + 4
        } else {
            skimperPoints = skimperPoints + 6
        }
        question1Answered = true
        
        sender.layer.cornerRadius = 10
        sender.clipsToBounds = true
        
        UIView.animateWithDuration(0.5, animations: {
            sender.backgroundColor = UIColorFromRGB("37b878", alpha: 0.7)
        })
    }
    
    
    @IBAction func monthlyIncome(sender: UIButton) {
        if sender.tag == 1 {
            skimperPoints = skimperPoints + 6
        } else if sender.tag == 2 {
            skimperPoints = skimperPoints + 4
        } else {
            skimperPoints = skimperPoints + 2
        }
        question2Answered = true
        
        sender.layer.cornerRadius = 10
        sender.clipsToBounds = true
        
        UIView.animateWithDuration(0.5, animations: {
            sender.backgroundColor = UIColorFromRGB("37b878", alpha: 0.7)
        })
        
    }
    
    @IBAction func goals(sender: UIButton) {
        if sender.tag == 1 {
            skimperPoints = skimperPoints + 6
        } else if sender.tag == 2 {
            skimperPoints = skimperPoints + 4
        } else {
            skimperPoints = skimperPoints + 2
        }
        question3Answered = true
        
        sender.layer.cornerRadius = 10
        sender.clipsToBounds = true
        
        UIView.animateWithDuration(0.5, animations: {
            sender.backgroundColor = UIColorFromRGB("37b878", alpha: 0.7)
        })
    }
    
    @IBAction func howGoodAreYou(sender: UIButton) {
        if sender.tag == 1 {
            skimperPoints = skimperPoints + 6
        } else if sender.tag == 2 {
            skimperPoints = skimperPoints + 4
        } else {
            skimperPoints = skimperPoints + 2
        }
        
        question4Answered = true
        
        sender.layer.cornerRadius = 10
        sender.clipsToBounds = true
        
        UIView.animateWithDuration(0.5, animations: {
            sender.backgroundColor = UIColorFromRGB("37b878", alpha: 0.7)
        })
        
        UIView.animateWithDuration(0.5, animations: {
            self.submitButton.alpha = 1
        })
        
        
    }
    
    @IBAction func `continue`(sender: UIButton) {
        if question1Answered && question2Answered && question3Answered && question4Answered {
            
            if skimperPoints <= 10 {
                skimperStatus = "Casual Skimper"
            } else if skimperPoints > 10 && skimperPoints <= 18 {
                skimperStatus = "Super Skimper"
            } else if skimperPoints > 18 {
                skimperStatus = "Hardcore Skimper"
            }
            
            self.performSegueWithIdentifier("skimperStatus", sender: self)
            
        } else {
            displayAlert("Error", message: "Make sure all the questions are answered")
        }
    }
    func displayAlert(title: String, message: String) {
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: {
            (action) -> Void in
            
            
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "skimperStatus" {
            var svc = segue.destinationViewController as! CongratsViewController
            svc.skimperClass = skimperStatus
        }
    }

}
