//
//  AdModel.swift
//  FixeAds
//
//  Created by Hugo Sousa on 22/11/2015.
//  Copyright © 2015 FixeAds. All rights reserved.
//

import Foundation
import RealmSwift

class AdPhotoModel: Object {
    dynamic var photoURL: String = ""
}

class AdModel: Object {
    dynamic var id = ""
    dynamic var title = ""
    dynamic var url = ""
    dynamic var created = ""
    dynamic var adDescription = ""
    dynamic var mapLatitude = ""
    dynamic var mapLongitude = ""
    dynamic var cityLocation = ""
    dynamic var userLabel = ""
    dynamic var listLabel = ""
    var photos = List<AdPhotoModel>()
    
    convenience required init(dictionaryRepresentation dictionary: NSDictionary) {
        self.init()
        if let validId: String = dictionary["id"] as? String {
            self.id = validId
        }
        
        if let validTitle: String = dictionary["title"] as? String {
            self.title = validTitle
        }
        
        if let validURL: String = dictionary["url"] as? String {
            self.url = validURL
        }
        
        if let validCreated: String = dictionary["created"] as? String {
            self.created = validCreated
        }
        
        if let validAdDescription: String = dictionary["description"] as? String {
            self.adDescription = validAdDescription
        }
        
        if let validMapLatitude: String = dictionary["map_lat"] as? String {
            self.mapLatitude = validMapLatitude
        }
        
        if let validMapLongitude: String = dictionary["map_lon"] as? String {
            self.mapLongitude = validMapLongitude
        }
        
        if let validCityLocation: String = dictionary["city_label"] as? String {
            self.cityLocation = validCityLocation
        }
        
        if let validUserLabel: String = dictionary["user_label"] as? String {
            self.userLabel = validUserLabel
        }
        
        if let validListLabel: String = dictionary["list_label"] as? String {
            self.listLabel = validListLabel
        }
       
        if let photos = dictionary["photos"] as? Dictionary<String,AnyObject> {
            
            let riakKey = photos["riak_key"] as! Int
            
            if let data = photos["data"] as? Array<Dictionary<String, AnyObject>> {
                
                for dictionary in data {
                    
                    let slotId = dictionary["slot_id"] as! Int
                    let w = dictionary["w"] as! Int
                    let h = dictionary["h"] as! Int
                    
                    let adPhotoModel = AdPhotoModel()
                    
                    adPhotoModel.photoURL = "http://img.olx.pt/images_olxpt/\(riakKey)_\(slotId)_\(w)x\(h).jpg"
                    
                    self.photos.append(adPhotoModel)
                }
            }
        }
    }
}