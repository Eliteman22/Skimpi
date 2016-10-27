//
//  Assessment2ViewController.swift
//  Skimpi
//
//  Created by Flavio Lici on 6/16/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class Assessment2ViewController: UIViewController {
    
    var dateOfBirth: String!
    var income: String!
    var maritalStatus: String!
    var budgetingType: String!
    
    var eatingBudget: String!
    
    @IBOutlet weak var answer1: UIButton!
    
    @IBOutlet weak var answer2: UIButton!
    
    @IBOutlet weak var answer3: UIButton!
    
    @IBOutlet weak var coolImage: UIImageView!
    
    
    @IBOutlet weak var nextButton: UIButton!
    
    var defaultColor: UIColor!

    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.alpha = 0
        nextButton.enabled = false
        coolImage.alpha = 1
        
        defaultColor = answer1.backgroundColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func selectAnAnswer(sender: UIButton) {
        
        UIView.animateWithDuration(0.5, animations: {
            self.nextButton.alpha = 1
            self.nextButton.enabled = true
            self.coolImage.alpha = 1
        })
        
        if sender.tag == 1 {
            eatingBudget = "Low"
            
            answer1.backgroundColor = UIColorFromRGB("1EA300")
            answer2.backgroundColor = defaultColor
            answer3.backgroundColor = defaultColor
            
            
        } else if sender.tag == 2 {
            eatingBudget = "Medium"
            
            answer1.backgroundColor = defaultColor
            answer2.backgroundColor = UIColorFromRGB("1EA300")
            answer3.backgroundColor = defaultColor
            
        } else if sender.tag == 3 {
            eatingBudget = "High"
            
            answer1.backgroundColor = defaultColor
            answer2.backgroundColor = defaultColor
            answer3.backgroundColor = UIColorFromRGB("1EA300")
            
        }
    }
    
    
    @IBAction func nextScene(sender: UIButton) {
        
        if eatingBudget != nil {
            self.performSegueWithIdentifier("toAssesment3", sender: self)
        } else {
            displayAlert("Error", message: "Please select answer")
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
        if segue.identifier == "toAssesment3" {
            var svc = segue.destinationViewController as! Assessment3ViewController
            svc.dateOfBirth = dateOfBirth
            svc.income = income
            svc.maritalStatus = maritalStatus
            svc.budgetingType = budgetingType
            svc.eatingBudget = eatingBudget
        }
    }
    
}
