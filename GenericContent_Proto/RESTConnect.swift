//
//  RESTConnect.swift
//  GenericContent_Proto
//
//  Created by Garrett Minky on 12/5/15.
//  Copyright © 2015 Garrett Minky. All rights reserved.
//

import Foundation

typealias ServiceResponse = (JSON, NSError?) -> Void

class RESTConnect : NSObject{
    
    static let instance = RESTConnect()
    
    let baseURL = "https://demo2018719.mockable.io/"
    
    func getArticles(onComplete: (JSON)-> Void){
    
        let realURL = baseURL + "getAllArticles/"
    
        getHTTPRequest(realURL, onComplete: { json, err in onComplete(json as JSON)})
            
        }
    
    func getHTTPRequest(path: String, onComplete: ServiceResponse){
        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            let json:JSON = JSON(data: data!)
            onComplete(json, error)
        })
        task.resume()
    }
    
    
}