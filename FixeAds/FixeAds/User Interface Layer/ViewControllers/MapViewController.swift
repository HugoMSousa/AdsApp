//
//  MapViewController.swift
//  FixeAds
//
//  Created by Hugo Sousa on 22/11/2015.
//  Copyright © 2015 FixeAds. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    var location: CLLocationCoordinate2D!
    
    var latitude: String = ""
    var longitude: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        location = CLLocationCoordinate2D()
        location.latitude = Double(latitude)!
        location.longitude = Double(longitude)!
        
        let METERS_PER_MILE = 1609.344
        
        let viewRegion :MKCoordinateRegion  = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.5 * METERS_PER_MILE, longitudeDelta: 0.5*METERS_PER_MILE))
        
        // It crashes with Invalid Region
        //self.mapView.setRegion(viewRegion, animated: true)
    }
}