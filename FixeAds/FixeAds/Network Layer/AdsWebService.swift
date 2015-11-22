//
//  AdsWebService.swift
//  FixeAds
//
//  Created by Hugo Sousa on 22/11/2015.
//  Copyright © 2015 FixeAds. All rights reserved.
//

import Foundation

class AdsWebService {
    
    func fetchAdCategory(categoryId: String, completion: (NSDictionary, NSError?)-> ()) {
        
        let urlString = "https://olx.pt/i2/ads/?json=1&search[category_id]=\(categoryId)"
       
        if let url = NSURL(string: urlString) {
            NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
                
                if (error != nil) {
                    completion(NSDictionary(), error)
                    return
                }
                if let data = data {
                    do {
                        let result = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
                        completion(result, nil)
                    } catch let error as NSError {
                        completion(NSDictionary(), error)
                    }
                }
            }.resume()
        }
    }
}