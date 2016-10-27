//
//  Assesment4ViewController.swift
//  Skimpi
//
//  Created by Flavio Lici on 6/16/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class Assesment4ViewController: UIViewController {
    
    var dateOfBirth: String!
    var income: String!
    var maritalStatus: String!
    var budgetingType: String!
    
    var eatingBudget: String!
    
    var sportsInterest: Float!
    var FineArtsInterest: Float!
    var SocialVenueInterest: Float!
    
    var charityInterest: Float!
    var ShoppingInterest: Float!
    var TravelingInterest: Float!
    
    @IBOutlet weak var charitySlider: UISlider!
    @IBOutlet weak var shoppingSlider: UISlider!
    @IBOutlet weak var travelingSlider: UISlider!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func charityMoved(sender: UISlider) {
        charityInterest = charitySlider.value
    }
    
    @IBAction func shoppingMoved(sender: UISlider) {
        ShoppingInterest = shoppingSlider.value
    }
    
    @IBAction func travelingMoved(sender: UISlider) {
        TravelingInterest = travelingSlider.value
    }
    
    @IBAction func finish(sender: UIButton) {
        PFUser.currentUser()?.setObject(dateOfBirth, forKey: "DateOfBirth")
        PFUser.currentUser()?.setObject(income, forKey: "Income")
        PFUser.currentUser()?.setObject(maritalStatus, forKey: "maritalStatus")
        PFUser.currentUser()?.setObject(budgetingType, forKey: "budgetingType")
        
        var interestArray = [sportsInterest, FineArtsInterest, SocialVenueInterest]
        PFUser.currentUser()?.setObject(interestArray, forKey: "sports_arts_social")
        
        var otherInterests = [charityInterest, ShoppingInterest, TravelingInterest]
        PFUser.currentUser()?.setObject(otherInterests, forKey: "charity_shopping_travel")
        
        PFUser.currentUser()?.saveInBackground()
        
        
        
    }
    

}
