//
//  DOBQuizViewController.swift
//  Skimpi
//
//  Created by Flavio Lici on 6/15/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class DOBQuizViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var dateOfBirth: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var DOB: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.alpha = 0
        nextButton.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        UIView.animateWithDuration(0.5, animations: {
            self.nextButton.alpha = 1
            self.nextButton.enabled = true
        })
    }
    
    @IBAction func nextScreen(sender: UIButton) {
        if dateOfBirth.text!.isEmpty {
            displayAlert("Error", message: "Please fill in the date of birth field")
        } else {
            performSegueWithIdentifier("afterDOB", sender: self)
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
        if segue.identifier == "afterDOB" {
            var svc = segue.destinationViewController as! IncomeViewController
            svc.dateOfBirth = DOB
        }
    }

}
