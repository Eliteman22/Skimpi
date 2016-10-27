//
//  FinicityTrialViewController.swift
//  Skimpi
//
//  Created by Flavio Lici on 6/6/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Alamofire
import Parse

class FinicityTrialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let header = ["Finicity-App-Key":"443f24c44d53ab28032fa21662892ac5",
                      "Content-Type":"application/xml"]
        let params = ["partnerId":"2445581495431",
                      "partnerSecret":"C4URGj1Sk3WZGMITpZfx"]

        Alamofire.request(.POST, "https://api.finicity.com/aggregation/v2/partners/authentication", parameters: params, encoding: .JSON, headers: header).responseJSON {
            response in
            print(response)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
