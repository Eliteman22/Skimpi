//
//  SetPinViewController.swift
//  Skimpi
//
//  Created by Flavio Lici on 6/4/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class SetPinViewController: UIViewController {
    
    @IBOutlet weak var num1: UILabel!
    @IBOutlet weak var num2: UILabel!
    @IBOutlet weak var num3: UILabel!
    @IBOutlet weak var num4: UILabel!
    
    @IBOutlet weak var enterPin: UITextField!
    
    @IBOutlet weak var verifyPin: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func enterNumber(sender: UIButton) {
        if num1.text!.isEmpty {
            putNum(sender, num: 1)
        } else if num2.text!.isEmpty{
            putNum(sender, num: 2)
        } else if num3.text!.isEmpty{
            putNum(sender, num: 3)
        } else if num4.text!.isEmpty {
            putNum(sender, num: 4)
        }
        
        
    }
    
    func putNum(sender: UIButton, num: Int) {
        
        if sender.tag == 1 {
            if num == 1 {
                num1.text = "1"
            } else if num == 2 {
                num2.text = "1"
            } else if num == 3 {
                num3.text = "1"
            } else if num == 4 {
                num4.text = "1"
            }
        } else if sender.tag == 2 {
            if num == 1 {
                num1.text = "2"
            } else if num == 2 {
                num2.text = "2"
            } else if num == 3 {
                num3.text = "2"
            } else if num == 4 {
                num4.text = "2"
            }
        } else if sender.tag == 3 {
            if num == 1 {
                num1.text = "3"
            } else if num == 2 {
                num2.text = "3"
            } else if num == 3 {
                num3.text = "3"
            } else if num == 4 {
                num4.text = "3"
            }
        } else if sender.tag == 4 {
            if num == 1 {
                num1.text = "4"
            } else if num == 2 {
                num2.text = "4"
            } else if num == 3 {
                num3.text = "4"
            } else if num == 4 {
                num4.text = "4"
            }
        } else if sender.tag == 5 {
            if num == 1 {
                num1.text = "5"
            } else if num == 2 {
                num2.text = "5"
            } else if num == 3 {
                num3.text = "5"
            } else if num == 4 {
                num4.text = "5"
            }
        } else if sender.tag == 6 {
            if num == 1 {
                num1.text = "6"
            } else if num == 2 {
                num2.text = "6"
            } else if num == 3 {
                num3.text = "6"
            } else if num == 4 {
                num4.text = "6"
            }
        } else if sender.tag == 7 {
            if num == 1 {
                num1.text = "7"
            } else if num == 2 {
                num2.text = "7"
            } else if num == 3 {
                num3.text = "7"
            } else if num == 4 {
                num4.text = "7"
            }
        } else if sender.tag == 8 {
            if num == 1 {
                num1.text = "8"
            } else if num == 2 {
                num2.text = "8"
            } else if num == 3 {
                num3.text = "8"
            } else if num == 4 {
                num4.text = "8"
            }
        } else if sender.tag == 9 {
            if num == 1 {
                num1.text = "9"
            } else if num == 2 {
                num2.text = "9"
            } else if num == 3 {
                num3.text = "9"
            } else if num == 4 {
                num4.text = "9"
            }
        } else if sender.tag == 0 {
            if num == 1 {
                num1.text = "0"
            } else if num == 2 {
                num2.text = "0"
            } else if num == 3 {
                num3.text = "0"
            } else if num == 4 {
                num4.text = "0"
            }
        }
    }
    
    @IBAction func backButton(sender: UIButton) {
        if num2.text!.isEmpty {
            if !(num1.text?.isEmpty)! {
                num1.text = ""
            }
        } else if num3.text!.isEmpty && !(num2.text?.isEmpty)! {
            num2.text = ""
        } else if num4.text!.isEmpty && !(num3.text?.isEmpty)! {
            num3.text = ""
        } else if !(num4.text?.isEmpty)! {
            num4.text = ""
        }
    }
    
    @IBAction func submit(sender: UIButton) {
        if verifyPin.text == nil || enterPin.text == nil || verifyPin.text != enterPin.text {
            displayAlert("Error", message: "Please make sure you enter a 4 digit pin")
        } else {
            var pin = Int(verifyPin.text!)
            PFUser.currentUser()?.setObject(pin!, forKey: "Pin")
            PFUser.currentUser()?.saveInBackground()
            self.performSegueWithIdentifier("toMainScreen", sender: self)
            
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

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
