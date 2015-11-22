//
//  AdCategoryViewModel.swift
//  FixeAds
//
//  Created by Hugo Sousa on 22/11/2015.
//  Copyright © 2015 FixeAds. All rights reserved.
//

import Foundation

class AdCategoryViewModel {
    
    var id: String = ""
    var iconURL: NSURL? = nil
    var locationDescription: String = ""
    var ads: Array<AdViewModel> = Array()
    
    init(adCategoryModel: AdCategoryModel) {
        self.id = adCategoryModel.id
        self.iconURL = NSURL(string: adCategoryModel.iconURL)
        self.locationDescription = adCategoryModel.locationDescription
        
        for (_, element) in adCategoryModel.ads.enumerate() {
            let adViewModel = AdViewModel(adModel: element)
            ads.append(adViewModel)
        }
    }
}