//
//  RootIphoneRouter.swift
//  FixeAds
//
//  Created by Hugo Sousa on 21/11/2015.
//  Copyright © 2015 FixeAds. All rights reserved.
//

import UIKit

class RootIPhoneRouter: Router {
    
    let navController : UINavigationController
    
    override init(parent: Router?) {
        navController = UINavigationController()
        super.init(parent: parent)
        self.rootViewController = navController
        self.showAdCategoryScreenAnimated(false)
    }
    
    func showAdCategoryScreenAnimated(animated: Bool) {
        if let viewController = ModuleFactory.adCategoryScreen() {
            self.navController .setViewControllers([viewController], animated: animated)
        }
    }
    
    func showAdDetailScreenAnimated(animated: Bool) {
        
    }
    
}
