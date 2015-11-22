//
//  AdCategoryModel.swift
//  FixeAds
//
//  Created by Hugo Sousa on 22/11/2015.
//  Copyright © 2015 FixeAds. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class AdCategoryModel: Object {
    dynamic var id = ""
    dynamic var iconURL = ""
    dynamic var locationDescription = ""
    let ads = List<AdModel>()
    
    convenience required init(dictionaryRepresentation dictionary: NSDictionary) {
        self.init()
        if let validId: String = dictionary["category_id"] as? String {
            self.id = validId
        }
        
        if let validIconURL: String = dictionary.valueForKeyPath("top_header_labels.category_icon") as? String {
            self.iconURL = validIconURL
        }
        
        if let validLocationDescription: String = dictionary.valueForKeyPath("top_header_labels.location_label") as? String {
            self.locationDescription = validLocationDescription
        }
        
        if let validAds = dictionary["ads"] as? Array<Dictionary<String,AnyObject>> {
            for dictionary in validAds {
                let adModel = AdModel(dictionaryRepresentation: dictionary)
                ads.append(adModel)
            }
        }
    }
}