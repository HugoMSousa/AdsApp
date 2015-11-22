//
//  ModuleFactory.swift
//  FixeAds
//
//  Created by Hugo Sousa on 21/11/2015.
//  Copyright © 2015 FixeAds. All rights reserved.
//

import UIKit

class ModuleFactory {
    
    class func rootIPhoneRouter(parent: Router?) -> RootIPhoneRouter {
        return RootIPhoneRouter(parent: parent)
    }
    
    class func rootIPadRouter(parent: Router?) -> RootIPadRouter {
        return RootIPadRouter(parent: parent)
    }
    
    class func adCategoryScreen() -> AdCategoryViewController? {
        let vc: AdCategoryViewController? = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(AdCategoryViewController) as? AdCategoryViewController
        vc?.adCategoryScreenViewModel = AdCategoryScreenViewModel()
        
        return vc
    }
    
    class func adDetailScreen() -> AdDetailViewController? {
        
        let vc: AdDetailViewController? = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(AdDetailViewController) as? AdDetailViewController
        return vc
    }
    
    class func mapScreen(latitude: String, longitude: String) -> MapViewController? {
        
        let vc: MapViewController? = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(MapViewController) as? MapViewController
        vc?.latitude = latitude
        vc?.longitude = longitude
        return vc
    }
    
}