//
//  SelectBankViewController.swift
//  Skimpi
//
//  Created by Flavio Lici on 6/2/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse
import Alamofire

class SelectBankViewController: UIViewController {
    
    @IBOutlet weak var continueButton: UIButton!
    
    var bankName: String!
    
    @IBOutlet weak var bankUsername: UITextField!
    
    @IBOutlet weak var bankPassword: UITextField!
    
    
    @IBOutlet weak var nameOfBank: UILabel!
    
    
    
    
    
    var authHeader = ["":""]
    var cobSess: String!
    var userSess: String!
    var selectedBankId: String!
    
    @IBOutlet weak var blackoutScreen: UIView!
    
    @IBOutlet weak var loginScreen: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen.alpha = 0
        blackoutScreen.alpha = 0
        continueButton.alpha = 0
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
                        
//                        Alamofire.request(.GET, "https://developer.api.yodlee.com/ysl/restserver/v1/providers/2852", headers: self.authHeader).responseJSON {
//                            response in switch response.result {
//                            case .Success(let JSON):
//                                let res = JSON as! NSDictionary
//                                let provider = res.objectForKey("provider")
//                                
//                                print(res)
//                                
//                            case  .Failure(let error):
//                                print("There was an error")
//                            }
//                            
//                        }
                        
                        self.findBank("Bank of America")
                    
                        
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
    
    func findBank(bankName: String) {
        Alamofire.request(.GET, "https://developer.api.yodlee.com/ysl/restserver/v1/providers", headers: self.authHeader).responseJSON {
            response in switch response.result {
            case .Success(let JSON):
                
                let res = JSON as! NSDictionary
                let prov = res["provider"]
                if let providers = prov as? [[String: AnyObject]] {
                    for provider in providers {
                        if provider["name"] as! String == bankName {
                            let id = provider["id"]
                            self.selectedBankId = id!.stringValue
                            
                            Alamofire.request(.GET, "https://developer.api.yodlee.com/ysl/restserver/v1/providers/\(id)", headers: self.authHeader).responseJSON {
                                response in
                                
                            }
                            
                        }
                    }
                }
                
            case .Failure(let error):
                print("FAILED")
            }
            
        }
    }
    
    
    @IBAction func setBoa(sender: UIButton) {
        bankName = "Bank of America"
        openBankLogin()
    }
    
    @IBAction func setChase(sender: UIButton) {
        bankName = "Chase"
        openBankLogin()
    }
    
    @IBAction func setWellsFargo(sender: UIButton) {
        bankName = "Wells Fargo"
        openBankLogin()
    }
    
    @IBAction func setTD(sender: UIButton) {
        bankName = "TD"
        openBankLogin()
    }
   
    @IBAction func setCiti(sender: UIButton) {
        bankName = "Citi"
        openBankLogin()
    }
    
    
    func addProviderAccount(loginCreds: String, providerId: Int) {
        

        
        var params = [ "credentialsParam": loginCreds,
                       "providerId": providerId
        ]
        
        Alamofire.request(.POST, "https://developer.api.yodlee.com/ysl/restserver/v1/providers/providerAccounts", parameters: params as! [String : AnyObject]).responseJSON {
            response in
            
        }
    }
    
    func openBankLogin() {
        nameOfBank.text = bankName
        UIView.animateWithDuration(0.5, animations: {
            self.blackoutScreen.alpha = 0.6
        })
        UIView.animateWithDuration(0.5, animations: {
            self.loginScreen.alpha = 1
        })
        
        if bankName == "Bank of America" {
            loginScreen.backgroundColor = UIColorFromRGB("f04249")
            findBank("Bank of America")
        } else if bankName == "Chase" {
            loginScreen.backgroundColor = UIColorFromRGB("8fceec")
            findBank("Chase")
        } else if bankName == "Wells Fargo" {
            loginScreen.backgroundColor = UIColorFromRGB("5f5f5f")
            findBank("Wells Fargo")
        } else if bankName == "TD" {
            loginScreen.backgroundColor = UIColorFromRGB("6db86d")
            findBank("TD")
        } else if bankName == "Citi" {
            loginScreen.backgroundColor = UIColorFromRGB("5a86b6")
            findBank("Citi")
            
        } else {
            //Search for bankn
        }
    }
    
    @IBAction func back(sender: UIButton) {
        bankName = ""
        UIView.animateWithDuration(0.5, animations: {
            self.blackoutScreen.alpha = 0
            self.loginScreen.alpha = 0
        })
    }
    
    
    @IBAction func submitBankInfo(sender: UIButton) {
        if bankUsername.text!.isEmpty || bankPassword.text!.isEmpty {
            
            displayAlert("Error", message: "Please fill in all the fields")
            
        } else {
            if selectedBankId != nil {
                
                var params = ["cobrandLogin":"sbCobjeromebuffet1996",
                              "cobrandPassword": "aa50fd63-abe3-4876-810a-d7bc24bbac9e"
                    
                ]
                
                PFUser.currentUser()?.setObject(bankUsername.text!, forKey: "Bank1Username")
                PFUser.currentUser()?.setObject(bankPassword.text!, forKey: "Bank1Password")
                PFUser.currentUser()?.setObject(bankName, forKey: "Bank1Name")
                PFUser.currentUser()?.saveInBackground()
                
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
                                
                                
                                self.findBank("Bank of America")
                                
                                if let path = NSBundle.mainBundle().pathForResource("test", ofType: "json") {
                                    do {
                                        let jsonData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                                        do {
                                            let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                                            
                                            
                                            
                                            let params = ["providerParam":jsonData]
                                            
                                            Alamofire.request(.POST, "https://developer.api.yodlee.com/ysl/restserver/v1/providers/2852", parameters: params, headers: self.authHeader).responseJSON {
                                                response in
                                                
                                                print(response)
                                                
                                                self.performSegueWithIdentifier("bankSelected", sender: self)
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
