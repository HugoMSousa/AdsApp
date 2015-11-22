//
//  AdCategoryViewModel.swift
//  FixeAds
//
//  Created by Hugo Sousa on 21/11/2015.
//  Copyright © 2015 FixeAds. All rights reserved.
//

import UIKit

class AdCategoryScreenViewModel {
    
    var adCategoryViewModel: AdCategoryViewModel? = nil
    
    func fetchCategoryWithId(id: String, completion:(adCategoryViewModel: AdCategoryViewModel?, error: NSError?)->()) {
        AdsDataStore.sharedInstance.adCategory(id, completion: {[weak self] (adCategoryModel, error) -> () in
            
            if let adCategoryModel = adCategoryModel {
                self?.adCategoryViewModel = AdCategoryViewModel(adCategoryModel: adCategoryModel)
                completion(adCategoryViewModel: self?.adCategoryViewModel, error: error)
            }
        })
    }
}
