//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class NetworkController {
    
    static func fetchMyNews() {

    }
    
}

class NewsController {
    
   static let sharedInstance = NewsController()
    
    func createNews() {

    }
    
}

NewsController.sharedInstance.createNews()

NetworkController.fetchMyNews()
