//
//  Assessment3ViewController.swift
//  Skimpi
//
//  Created by Flavio Lici on 6/16/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class Assessment3ViewController: UIViewController {
    
    var dateOfBirth: String!
    var income: String!
    var maritalStatus: String!
    var budgetingType: String!
    
    var eatingBudget: String!
    
    var sportsInterest: Float!
    var FineArtsInterest: Float!
    var SocialVenueInterest: Float!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var bottomImage: UIImageView!
    
    
    @IBOutlet weak var sportsSlider: UISlider!
    
    @IBOutlet weak var fineArts: UISlider!
    
    @IBOutlet weak var socialVenues: UISlider!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    @IBAction func sportsValueChanged(sender: UISlider) {
        sportsInterest = sender.value
    }

    @IBAction func artsValueChanged(sender: UISlider) {
        FineArtsInterest = sender.value
        
    }
    
    @IBAction func socialValueChanged(sender: UISlider) {
        SocialVenueInterest = sender.value
    }
    
    @IBAction func nextScene(sender: UIButton) {
        if sportsInterest != nil && FineArtsInterest != nil && SocialVenueInterest != nil {
            self.performSegueWithIdentifier("toAssesment4", sender: self)
        } else {
            displayAlert("Error", message: "Make sure to select an interest for all categories")
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
        if segue.identifier == "toAssesment4" {
            var svc = segue.destinationViewController as! Assesment4ViewController
            svc.dateOfBirth = dateOfBirth
            svc.income = income
            svc.maritalStatus = maritalStatus
            svc.budgetingType = budgetingType
            
            svc.eatingBudget = eatingBudget
            svc.sportsInterest = sportsInterest
            svc.FineArtsInterest = FineArtsInterest
            svc.SocialVenueInterest = SocialVenueInterest
        }
    }
    
}
