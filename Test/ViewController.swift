//
//  ViewController.swift
//  Test
//
//  Created by Wayman, Zacheriah on 11/5/19.
//  Copyright © 2019 Wayman, Zacheriah. All rights reserved.
//

import UIKit
import GoogleMaps
import FirebaseAuth
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var mapView: UIView!
    let locationmanager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 35.307090, longitude: -80.735671,    zoom: 17.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 35.307090, longitude: -80.735671)
        marker.title = "T-Rex"
        marker.snippet = "Woodward Hall"
        marker.map = mapView
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: 35.308609, longitude: -80.733658)
        marker2.title = "Plesiosaurus"
        marker2.snippet = "Student Union"
        marker2.map = mapView
    }

    func enablebasiclocationservices(){
        locationmanager.delegate = (self as! CLLocationManagerDelegate)
        
        switch CLLocationManager.authorizationStatus(){
        case .notDetermined:
            locationmanager.requestAlwaysAuthorization()
        case .restricted:
            //asa
            print("y tho")
        case .denied:
            //asa
            print("y tho")
        case .authorizedAlways:
            //do stuff in this one, extension for viewcontroller based on CLLOcationmanager
            print("this one")
        case .authorizedWhenInUse:
            <#code#>
        }
    }
    
    @IBAction func profileButton(_ sender: Any) {
        AppDelegate.showProfile()
    }
    @IBAction func logOutButton(_ sender: Any) {
        do { // signs the user out
            try Auth.auth().signOut()
            AppDelegate.showTitle()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}

