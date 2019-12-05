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
    var long = 0.0
    var lat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enablebasiclocationservices()
    }

    func enablebasiclocationservices(){
        locationmanager.delegate = self
        
        switch CLLocationManager.authorizationStatus(){
        case .notDetermined:
            locationmanager.requestWhenInUseAuthorization()
            break
        case .restricted, .denied:
            //asa
            print("y tho")
        case .authorizedAlways, .authorizedWhenInUse:
            self.locationmanager.startUpdatingLocation()
            let camera = GMSCameraPosition.camera(withLatitude: 35.307090, longitude: -80.735671, zoom: 17.0)
            let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
            view = mapView
            mapView.delegate = self
            mapView.isMyLocationEnabled = true
            
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
    }
    func setupForLocationUpdates(){
        
        locationmanager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationmanager.distanceFilter = 1
        
        self.locationmanager.startUpdatingLocation()
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


extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status{
        case .notDetermined:
            break
        case .restricted, .denied:
            break
        case .authorizedAlways, .authorizedWhenInUse:
            setupForLocationUpdates()
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last!
        //long = Double(location.coordinate.longitude)
        //lat = Double(location.coordinate.latitude)
        long = -80.735671
        lat = 35.307090
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 17.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        print(location)
    }
}

extension ViewController: GMSMapViewDelegate{
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        //let x = pow(((locationmanager.location?.coordinate.latitude)! - marker.position.latitude), 2)
        //let y = pow(((locationmanager.location?.coordinate.longitude)! - marker.position.longitude), 2)
        //let dist = sqrt(x + y)
        //print(dist)
        performSegue(withIdentifier: "digSegue", sender: self)
        return true
        
    }
}
