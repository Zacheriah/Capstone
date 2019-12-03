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

class ViewController: UIViewController {

    @IBOutlet weak var mapView: UIView!
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

