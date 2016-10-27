
import Foundation

func == (lhs: transaction, rhs: transaction) -> Bool {
    return lhs.name == rhs.name && lhs.name == rhs.name
}

class transaction: Equatable {
    var amount: Int!
    var date: String!
    var name: String!
    var category: NSArray!
    
    
    init(amount: Int!, date: String!, name: String!, category: NSArray!) {
        self.amount = amount
        self.date = date
        self.name = name
        self.category = category
    }
    

    
}
