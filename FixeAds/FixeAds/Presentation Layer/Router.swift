//
//  Router.swift
//  FixeAds
//
//  Created by Hugo Sousa on 21/11/2015.
//  Copyright © 2015 FixeAds. All rights reserved.
//

import UIKit

class Router {
    weak var parent: Router? = nil
    var childRouters: Array<Router> = Array()
    var rootViewController: UIViewController? = nil
    
    init(parent: Router?) {
        self.parent = parent
    }
    
    // Modal Navigation Interface
    func presentViewController(viewController: UIViewController, animated: Bool, completion:()->()) {}
    func dismissViewControllerAnimated(animated: Bool, completion:()->()) {}
    
    // Stack Navigation Interface
    func pushViewController(viewController: UIViewController, animated: Bool) {}
    func popToRootViewControllerAnimated(animated: Bool) {}
    func popViewControllerAnimated(animated: Bool) {}
}