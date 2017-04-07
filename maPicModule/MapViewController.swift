//
//  MapViewController.swift
//  maPicModule
//
//  Created by Pedro Luis Berbel dos Santos on 07/04/17.
//  Copyright © 2017 Santosplb. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var takePictureButton: UIButton!
    
    let manager = CLLocationManager()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
     //Map and Location
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    
        
     // Picture
        takePictureButton.layer.cornerRadius = 5
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
//        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
//        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        let region: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(myLocation, 500, 500)
        mapView.setRegion(region, animated: false)
        self.mapView.showsUserLocation = true
    }
    
    
    
    
    @IBAction func takePictureButton(_ sender: Any) {
        //will create a picLocal in the same localization of the user.
    }
    


}
