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

    @IBOutlet weak var createPinView: UIImageView!
    @IBOutlet weak var createPinName: UITextField!
    @IBOutlet weak var createPinSub: UITextField!
    @IBOutlet weak var saveNewPin: UIButton!
    var createPinCoordinate = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPinView.isHidden = true
        createPinName.isHidden = true
        createPinSub.isHidden = true
        saveNewPin.isHidden = true
        
     //Map and Location
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
        
     // Picture
        takePictureButton.layer.cornerRadius = 5
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //this func will update every time that the user changes it location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
//        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
//        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        print("Deu erro aqui?")
        let region: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(myLocation, 500, 500)
       
        mapView.setRegion(region, animated: false)
  
//        self.mapView.showsUserLocation = true
    }
    
    

    
    
    
    @IBAction func takePictureButton(_ sender: Any) {
        //will create a picLocal(annotation) in the same localization where the user is.
    
        createPinView.isHidden = false
        createPinName.isHidden = false
        createPinSub.isHidden = false
        saveNewPin.isHidden = false
        takePictureButton.isHidden = true
        
        self.createPinCoordinate.coordinate = (manager.location?.coordinate)!
        

        
    }

    @IBAction func saveNewPin(_ sender: Any) {
        createPinView.isHidden = true
        createPinName.isHidden = true
        createPinSub.isHidden = true
        saveNewPin.isHidden = true
        takePictureButton.isHidden = false
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = self.createPinCoordinate.coordinate
        annotation.title = createPinName.text!
        annotation.subtitle = createPinSub.text!
        //    annotation.subtitle = manager.location?.timestamp as! String
        mapView.addAnnotation(annotation)
        
    }


    
    
    
}




















