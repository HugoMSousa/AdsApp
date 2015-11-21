//
//  UIStoryboard+Extensions.swift
//  FixeAds
//
//  Created by Hugo Sousa on 21/11/2015.
//  Copyright © 2015 FixeAds. All rights reserved.
//

import UIKit

extension UIStoryboard {
    func instantiateViewController(anyClass:AnyClass) -> UIViewController? {
        // get a class name and demangle for classes in Swift
        if let name = NSStringFromClass(anyClass).componentsSeparatedByString(".").last {
            return instantiateViewControllerWithIdentifier(name)
        }
        return nil
    }
}