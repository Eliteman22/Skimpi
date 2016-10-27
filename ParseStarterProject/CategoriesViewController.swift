//
//  CategoriesViewController.swift
//  Skimpi
//
//  Created by Flavio Lici on 6/5/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Alamofire
import SwiftGraph

class CategoriesViewController: UIViewController {
    
    var cobSess: String!
    var authHeader = ["":""]
    var userSess: String!
    
    var transactionGraph: Graph<transaction> = Graph<transaction>()
    
    var monthlyTransactions = [transaction]()
    
    @IBOutlet weak var foodProgress: UIProgressView!
    
    @IBOutlet weak var Groceries: UIProgressView!
    
    @IBOutlet weak var OnlineServicesProgress: UIProgressView!
    
    @IBOutlet weak var cableProgress: UIProgressView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calendar = NSCalendar.init(calendarIdentifier: NSCalendarIdentifierGregorian)
        let currentMonthInt = (calendar?.component(NSCalendarUnit.Month, fromDate: NSDate()))!
        print(currentMonthInt)
        
        if let path = NSBundle.mainBundle().pathForResource("transactions", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    if let transactions : [NSDictionary] = jsonResult["transactions"] as? [NSDictionary] {
                        var counter = 0
                        for transaction in transactions {
                            let date = transaction["date"] as! String
                           
                            let dateArray = date.componentsSeparatedByString("-")
                            
                            var comparator = Int(dateArray[1])
                        
                            if comparator != currentMonthInt {
                                break;
                            } else {
                                counter += 1
                                var amount = transaction["amount"] as! Int
                                var date = transaction["date"] as! String
                                var name = transaction["name"] as! String
                                var category: NSArray
                                if transaction["category"] != nil {
                                    category = transaction["category"] as! NSArray
                                } else {
                                    category = NSArray(array: ["Uncategorized"])
                                }

                                var newTransaction = createTransaction(amount, date: date, name: name, category: category)
                                
                                transactionGraph.addVertex(newTransaction)
                                transactionGraph.addEdge(UnweightedEdge(u: counter, v: counter, directed: false))
                                monthlyTransactions.append(newTransaction)
                            }
                        }
                        
                        print(transactionGraph)
                        
                    }
                } catch {}
            } catch {}
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createTransaction(amount: Int!, date: String!, name: String!, category: NSArray!)->transaction {
        var tran:transaction = transaction(amount: amount, date: date, name: name, category: category)
        return tran
    }
    
    func buildGraph(transactions: [transaction]) {
        
    }

}
