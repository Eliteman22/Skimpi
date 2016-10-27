//
//  IncomeViewController.swift
//  Skimpi
//
//  Created by Flavio Lici on 6/16/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit



class IncomeViewController: UIViewController, UITextFieldDelegate {
    
    var dateOfBirth: String!
    
    @IBOutlet weak var incomeField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var moneyChaser: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.alpha = 0
        moneyChaser.alpha = 0
        nextButton.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        UIView.animateWithDuration(0.5, animations: {
            self.moneyChaser.alpha = 1
            self.nextButton.alpha = 1
            self.nextButton.enabled = true
        })
    }
    
    @IBAction func nextScreen(sender: UIButton) {
        if incomeField.text!.isEmpty {
            displayAlert("Error", message: "Please enter an income")
        } else {
            self.performSegueWithIdentifier("toMaritalStatus", sender: self)
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
        if segue.identifier == "toMaritalStatus" {
            var svc = segue.destinationViewController as! MaritalStatusViewController
            svc.dateOfBirth = dateOfBirth
            svc.income = incomeField.text
        }
    }
}
