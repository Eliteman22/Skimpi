//
//  CategoriesViewController.swift
//  Skimpi
//
//  Created by Flavio Lici on 6/5/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Alamofire

class CategoriesViewController: UIViewController {
    
    var cobSess: String!
    var authHeader = ["":""]
    var userSess: String!
    
    @IBOutlet weak var foodProgress: UIProgressView!
    
    @IBOutlet weak var Groceries: UIProgressView!
    
    @IBOutlet weak var OnlineServicesProgress: UIProgressView!
    
    @IBOutlet weak var cableProgress: UIProgressView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodProgress.progress = 25 / 80
        Groceries.progress = 40 / 220
        OnlineServicesProgress.progress = 1
        cableProgress.progress = 10/65
        
        foodProgress.transform = CGAffineTransformScale(foodProgress.transform, 1, 5)
        Groceries.transform = CGAffineTransformScale(Groceries.transform, 1, 5)
        OnlineServicesProgress.transform = CGAffineTransformScale(OnlineServicesProgress.transform, 1, 5)
        cableProgress.transform = CGAffineTransformScale(cableProgress.transform, 1, 5)
        var params = ["cobrandLogin":"sbCobjeromebuffet1996",
                      "cobrandPassword": "aa50fd63-abe3-4876-810a-d7bc24bbac9e"
            
        ]

        Alamofire.request(.POST, "https://developer.api.yodlee.com/ysl/restserver/v1/cobrand/login", parameters: params).responseJSON {
            response in switch response.result {
            case .Success(let JSON):
                
                let res = JSON as! NSDictionary
                let sess = res["session"]
                self.cobSess = sess!["cobSession"]! as! String
                
                
                self.authHeader = ["Authorization":"cobSession=\(self.cobSess)"]
                
                let userParams = ["loginName":"sbMemjeromebuffet19961",
                    "password":"sbMemjeromebuffet19961#123"
                ]
                
                Alamofire.request(.POST, "https://developer.api.yodlee.com/ysl/restserver/v1/user/login", parameters: userParams, headers: self.authHeader).responseJSON {
                    response in switch response.result {
                    case .Success(let JSON):
                        let res = JSON as! NSDictionary
                        let usr = res["user"]
                        let sess = usr!.objectForKey("session")
                        self.userSess = sess!["userSession"]! as! String
                        
                        let params = ["cobSessionToken":self.cobSess,
                            "rsession": self.userSess,
                            "finAppId":"3A4CAE9B71A1CCD7FF41F51006E9ED00"
                        ]
                        
                        
                        
                        if let path = NSBundle.mainBundle().pathForResource("test", ofType: "json") {
                            do {
                                let jsonData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                                do {
                                    let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                                    
                                    
                                    
                                    let params = ["providerParam":jsonData]
                                    
                                    Alamofire.request(.POST, "https://developer.api.yodlee.com/ysl/restserver/v1/providers/2852", parameters: params, headers: self.authHeader).responseJSON {
                                        response in
                                        
                                        print(response)
                                    }
                                    
                                    
                                } catch {}
                            } catch {}
                        }
                        
            
                        
                   
                        
                        
                    case .Failure(let error):
                        print("User Request Failed")
                    }
                }
                
            case .Failure(let error):
                print("Request failed")
            }
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
