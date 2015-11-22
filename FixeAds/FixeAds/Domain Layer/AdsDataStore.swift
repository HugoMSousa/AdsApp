//
//  AdsDataStore.swift
//  FixeAds
//
//  Created by Hugo Sousa on 22/11/2015.
//  Copyright © 2015 FixeAds. All rights reserved.
//

import Foundation
import RealmSwift

class AdsDataStore {
    
    static let sharedInstance = AdsDataStore()
    private let webService: AdsWebService = AdsWebService()
    private let realm: Realm
    
    init () {
        // Realms are used to group data together
        self.realm = try! Realm() // Create realm pointing to default file
    }
    
    func adCategory(id: String, completion:(adCategoryModel: AdCategoryModel?, error: NSError?)->()) {
        
        // If it is already persisted return it
        let results = realm.objects(AdCategoryModel).filter("id == %@", id)
        if let adCategoryModel = results.first {
            completion(adCategoryModel: adCategoryModel, error: nil)
            return
        }
        
        // Otherwise fetch it from the webservice and syncronized it
        webService.fetchAdCategory(id) { [weak self] (result, error) -> () in
            if (error != nil) {
                completion(adCategoryModel: nil, error: error)
                return
            }
            
            // Create a new AdCategoryModel
            let adCategoryModel = AdCategoryModel(dictionaryRepresentation: result)
            
            dispatch_async(dispatch_get_main_queue()) {
                // Persist AdCategoryModel
                do {
                    self?.realm.beginWrite()
                    self?.realm.add(adCategoryModel)
                    try self?.realm.commitWrite()
                } catch {
                    completion(adCategoryModel: nil, error: error as NSError)
                    return
                }
                // If persist action succeed then we will retrieve the ad category
                completion(adCategoryModel: adCategoryModel, error: nil)
            }
        }
    }
}