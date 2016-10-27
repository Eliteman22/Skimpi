//
//  Assesment1ViewController.swift
//  Skimpi
//
//  Created by Flavio Lici on 6/16/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class Assesment1ViewController: UIViewController {
    
    var dateOfBirth: String!
    var income: String!
    var maritalStatus: String!
    var budgetingType: String!
    
    @IBOutlet weak var coolImage: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var answer1: UIButton!
    
    @IBOutlet weak var answer2: UIButton!
    
    @IBOutlet weak var answer3: UIButton!
    
    var defaultColor: UIColor!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.enabled = false
        coolImage.alpha = 0
        nextButton.alpha = 0
        
        defaultColor = answer1.backgroundColor
        
        answer1.layer.cornerRadius = 10
        answer1.clipsToBounds = true
        answer2.layer.cornerRadius = 10
        answer2.clipsToBounds = true
        answer3.layer.cornerRadius = 10
        answer3.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func answerQuestion(sender: UIButton) {
        
        UIView.animateWithDuration(0.5, animations: {
            self.nextButton.alpha = 1
            self.nextButton.enabled = true
            self.coolImage.alpha = 1
        })
        
        if sender.tag == 1 {
            budgetingType = "Low"
            
            answer1.backgroundColor = UIColorFromRGB("1EA300")
            answer2.backgroundColor = defaultColor
            answer3.backgroundColor = defaultColor
            
            
        } else if sender.tag == 2 {
            budgetingType = "Medium"
            
            answer1.backgroundColor = defaultColor
            answer2.backgroundColor = UIColorFromRGB("1EA300")
            answer3.backgroundColor = defaultColor
            
        } else if sender.tag == 3 {
            budgetingType = "High"
            
            answer1.backgroundColor = defaultColor
            answer2.backgroundColor = defaultColor
            answer3.backgroundColor = UIColorFromRGB("1EA300")
            
        }
    }
    
    
    @IBAction func nextScene(sender: UIButton) {
        if budgetingType != nil {
            self.performSegueWithIdentifier("toAssesment2", sender: self)
        } else {
            displayAlert("Error", message: "Please select an answer")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toAssesment2" {
            var svc = segue.destinationViewController as! Assessment2ViewController
            svc.dateOfBirth = dateOfBirth
            svc.income = income
            svc.maritalStatus = maritalStatus
            svc.budgetingType = budgetingType
        }
    }
    
    func displayAlert(title: String, message: String) {
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: {
            (action) -> Void in
            
            
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
