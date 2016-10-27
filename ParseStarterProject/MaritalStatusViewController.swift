//
//  MaritalStatusViewController.swift
//  Skimpi
//
//  Created by Flavio Lici on 6/16/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class MaritalStatusViewController: UIViewController {
    
    var dateOfBirth: String!
    var income: String!
    
    var maritalStatus: String!
    
    var singleSelected: Bool!
    var marriedSelected: Bool!
    
    @IBOutlet weak var single: UIButton!
    
    @IBOutlet weak var married: UIButton!
    
    @IBOutlet weak var coolPic: UIImageView!
    
    var defaultColor: UIColor!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultColor = married.backgroundColor!
        coolPic.alpha = 0
        nextButton.enabled = false
        nextButton.alpha = 0
        
        singleSelected = false
        marriedSelected = false
        single.layer.cornerRadius = 10
        single.clipsToBounds = true
        married.layer.cornerRadius = 10
        married.clipsToBounds = true
    }
    
    @IBAction func selectSingle(sender: UIButton) {
        
        if nextButton.alpha == 0 {
            UIView.animateWithDuration(0.5, animations: {
                self.nextButton.alpha = 1
                self.nextButton.enabled = true
            })
        }
        
        singleSelected = true
        maritalStatus = "Single"
        if marriedSelected == true {
            marriedSelected = false
            UIView.animateWithDuration(0.5, animations: {
                self.single.backgroundColor = UIColorFromRGB("1EA300")
                self.married.backgroundColor = self.defaultColor
            })
        } else {
            UIView.animateWithDuration(0.5, animations: {
                self.single.backgroundColor = UIColorFromRGB("1EA300")
            })
        }
    }
    
    @IBAction func selectMarried(sender: UIButton) {
        
        if nextButton.alpha == 0 {
            UIView.animateWithDuration(0.5, animations: {
                self.nextButton.alpha = 1
                self.nextButton.enabled = true
            })
        }
        
        marriedSelected = true
        maritalStatus = "Married"
        
        if singleSelected == true {
            singleSelected = false
            UIView.animateWithDuration(0.5, animations: {
                self.married.backgroundColor = UIColorFromRGB("1EA300")
                self.single.backgroundColor = self.defaultColor
            })
        } else {
            UIView.animateWithDuration(0.5, animations: {
                self.married.backgroundColor = UIColorFromRGB("1EA300")
            })
        }
        
    }
    
    @IBAction func nextScene(sender: UIButton) {
        if maritalStatus != nil || maritalStatus != "" {
            self.performSegueWithIdentifier("toAssesment1", sender: self)
        } else {
            displayAlert("Error", message: "Please select your marital status")
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func displayAlert(title: String, message: String) {
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: {
            (action) -> Void in
            
            
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toAssesment1" {
            var svc = segue.destinationViewController as! Assesment1ViewController
            svc.dateOfBirth = dateOfBirth
            svc.income = income
            svc.maritalStatus = maritalStatus
        }
    }

}
