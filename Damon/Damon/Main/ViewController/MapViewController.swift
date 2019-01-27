//
//  MapViewController.swift
//  Damon
//
//  Created by HwangSeungmin on 1/26/19.
//  Copyright © 2019 Min. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    
    var studyOrFitness: Int! = 0    // 0 if study, 1 if fitness
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation? = CLLocation(latitude: CLLocationDegrees(exactly: 49.2606)!, longitude: CLLocationDegrees(exactly: -123.246)!)
    var mapView: GMSMapView!
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    
    // An array to hold the list of likely places.
    var likelyPlaces: [GMSPlace] = []
    
    // The currently selected place.
    var selectedPlace: GMSPlace?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GMSServices.provideAPIKey(ConstCommon.googleMapAPI)
        GMSPlacesClient.provideAPIKey(ConstCommon.googleMapAPI)

        if studyOrFitness == 0 {
            self.navigationItem.title = "Find Study Buddy"
        } else {
            self.navigationItem.title = "Find Work Out Buddy"
        }
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
//
//        placesClient = GMSPlacesClient.shared()
//
//        let camera = GMSCameraPosition.camera(withLatitude: currentLocation!.coordinate.latitude,
//                                              longitude: currentLocation!.coordinate.longitude,
//                                              zoom: zoomLevel)
//        mapView = GMSMapView.map(withFrame: view.bounds, camera: camera)
//        mapView.settings.myLocationButton = true
//        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        //mapView.isMyLocationEnabled = true
//
//        // Add the map to the view, hide it until we've got a location update.
//        view.addSubview(mapView)
//        mapView.isHidden = true
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 49.2606, longitude: -123.246, zoom: 14.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
                
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 49.2606, longitude: -123.246)
        marker.title = "self"
        
        marker.map = mapView
        
        
        // Creates a marker in the center of the map.
        let marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2D(latitude: 49.2605, longitude: -123.2482)
        marker1.title = "Anon"
        
        marker1.map = mapView
        
        // Creates a marker in the center of the map.
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: 49.2620, longitude: -123.2369)
        marker2.title = "Anon"
        marker2.map = mapView
        
        // Creates a marker in the center of the map.
        let marker3 = GMSMarker()
        marker3.position = CLLocationCoordinate2D(latitude: 49.26075, longitude: -123.2453)
        marker3.title = "Anon"
        marker3.map = mapView
        
        // Creates a marker in the center of the map.
        let marker4 = GMSMarker()
        marker4.position = CLLocationCoordinate2D(latitude: 49.2614, longitude: -123.246)
        marker4.title = "Anon"
        marker4.map = mapView
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        currentLocation?.coordinate.latitude = manager.location!.coordinate.latitude
//        currentLocation?.coordinate.longitude = manager.location!.coordinate.longitude
//        print("locations = \(currentlocation) \(currentLocation.longitude)")
//    }
}
