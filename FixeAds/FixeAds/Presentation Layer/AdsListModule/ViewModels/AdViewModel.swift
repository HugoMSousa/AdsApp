//
//  AdDetailViewModel.swift
//  FixeAds
//
//  Created by Hugo Sousa on 21/11/2015.
//  Copyright © 2015 FixeAds. All rights reserved.
//

import Foundation

class AdViewModel {
    
    var id: String = ""
    var title:String = ""
    var url: NSURL? = nil
    var created: String  = ""
    var adDescription: String = ""
    var mapLatitude: String = ""
    var mapLongitude: String = ""
    var cityLocation: String = ""
    var userLabel: String = ""
    var listLabel: String = ""
    var photos: Array<NSURL> = Array()
    
    init(adModel: AdModel) {
        self.id = adModel.id
        self.title = adModel.title
        self.url = NSURL(string: adModel.url)
        self.created = adModel.created
        self.adDescription = adModel.adDescription
        self.mapLatitude = adModel.mapLatitude
        self.mapLongitude = adModel.mapLongitude
        self.cityLocation =  adModel.cityLocation
        self.userLabel = adModel.userLabel
        self.listLabel = adModel.listLabel
        
        for (_, element) in adModel.photos.enumerate() {
            if let photoURL = NSURL(string: element.photoURL) {
                self.photos.append(photoURL)
            }
        }
    }
}