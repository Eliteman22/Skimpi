//
//  SignupViewController.swift
//  Skimpi
//
//  Created by Flavio Lici on 6/4/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class SignupViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signup(sender: UIButton) {
        if email.text!.isEmpty || (username.text?.isEmpty)! || (password.text?.isEmpty)! {
            
            displayAlert("Error", message: "Make sure to fill in all the fields")
        } else {
            var user = PFUser()
            user.username = username.text
            user.password = password.text
            user.email = email.text
            
            
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool, error: NSError?) -> Void in
                if let error = error {
                    let errorString = error.userInfo["error"] as? NSString
                    self.displayAlert("Oops", message: "There was an error signing up")
                } else {
                    self.performSegueWithIdentifier("signup", sender: self)
                }
            }
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
