//
//  MapViewController.swift
//  Smart City
//
//  Created by Mahmoud on 4/1/21.
//  Copyright © 2021 mahmoud. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ForthViewController: UIViewController {
//    @IBOutlet weak var mapview: MKMapView!
//
  @IBOutlet weak var goButton: UIButton!
//
//    let locationManager = CLLocationManager()
//    @IBOutlet weak var addressLabel: UILabel!
//    var previousLocation: CLLocation?
//
   // let geoCoder = CLGeocoder()
      var directionsArray: [MKDirections] = []
      
    
        @IBOutlet weak var mapview: MKMapView!
        
        let locationmanager = CLLocationManager()
        var previousLocation: CLLocation?
           let regionInMeters: Double = 1000

        
    var coordinates : [Double]?
        override func viewDidLoad() {
            super.viewDidLoad()
            // change color of current location on mapview
            mapview.delegate=self
            mapview.tintColor = UIColor.blue
           demoMap()
            
       // getCenterLocation(for: mapview)
        checkLocationServices()
        }
            func demoMap() {
                // add annotation
                   var c = CLLocationCoordinate2D()
                c.latitude = (coordinates?[0])!
                c.longitude = (coordinates?[1])!
        
                   let a = MKPointAnnotation()
                   a.coordinate = c
                   a.title = "Hi"
                   mapview.addAnnotation(a)
                // zoom level
                let location = c
                let region = MKCoordinateRegion( center: location, latitudinalMeters: CLLocationDistance(exactly:300)!, longitudinalMeters: CLLocationDistance(exactly: 300)!)
                mapview.setRegion(mapview.regionThatFits(region), animated: true)
                
        
            }
        func setupLocationManager(){
            
            locationmanager.delegate=self
            locationmanager.desiredAccuracy=kCLLocationAccuracyBest
            
        }
        
        
//        func centerViewUserLocation(){
//
//            if let location = locationmanager.location?.coordinate{
//                let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
//                mapview.setRegion(region, animated: true)
//            }
//
//        }
        
        
        func checkLocationServices(){
            if CLLocationManager.locationServicesEnabled() {
                // set up location manager
                setupLocationManager()
                checkLocationAuthorization()
            }else{
                // show alert letting the user know they have to turn this on

            }
        
        }
        
        func checkLocationAuthorization(){
            switch CLLocationManager.authorizationStatus() {
            case .authorizedWhenInUse:
                //code
                mapview.showsUserLocation=true
                centerViewUserLocation()
                locationmanager.startUpdatingLocation()
                break
            case .denied:
              
                //code
                break
            case .notDetermined:
                //code
                locationmanager.requestWhenInUseAuthorization()
                break
            case .restricted:
                // code
              
                break
            case .authorizedAlways:
                //code
              
                break
            }
            
        }
    // center of our map
    func startTrackingUserLocation(){
        
        mapview.showsUserLocation = true
        centerViewUserLocation()
        locationmanager.startUpdatingLocation()
        previousLocation = getCenterLocation(for: mapview)
        
    }
    
    func getCenterLocation(for mapview:MKMapView)->CLLocation{
        let latitude = mapview.centerCoordinate.latitude
        let longitude = mapview.centerCoordinate.longitude
        print("\(latitude)")
        print("\(longitude)")
        return CLLocation(latitude: latitude, longitude: longitude)
        
        
    }
   func centerViewUserLocation(){
       
       if let location = locationmanager.location?.coordinate{
           
           let region = MKCoordinateRegion(center: location, latitudinalMeters: 300, longitudinalMeters: 300)
           mapview.setRegion(region, animated: true)
       }
   }
    
    
   
    func getDirections() {
      
        guard let location = locationmanager.location?.coordinate else {
            //TODO: Inform user we don't have their current location
            return
        }
        
        
        let request = createDirectionsRequest(from: location)
        
        let directions = MKDirections(request: request)
        resetMapView(withNew: directions)
      
        directions.calculate { [unowned self] (response, error) in
            //TODO: Handle error if needed
            guard let response = response else {  print(error?.localizedDescription)
                return } //TODO: Show response not available in an alert
          
               for route in response.routes {
        self.mapview.addOverlay(route.polyline)
                self.mapview.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
    }
    
    
    func createDirectionsRequest(from coordinate: CLLocationCoordinate2D) -> MKDirections.Request {
        let coords = CLLocationCoordinate2D(latitude: (coordinates?[0])!, longitude: (coordinates?[1])!)
        let destinationCoordinate       = coords
        let startingLocation            = MKPlacemark(coordinate: coordinate)
        let destination                 = MKPlacemark(coordinate: destinationCoordinate)
        
        let request                     = MKDirections.Request()
        request.source                  = MKMapItem(placemark: startingLocation)
        request.destination             = MKMapItem(placemark: destination)
        request.transportType           = .walking
        request.requestsAlternateRoutes = false
        
        

        return request
    }
    
    
    func resetMapView(withNew directions: MKDirections) {
        mapview.removeOverlays(mapview.overlays)
        directionsArray.append(directions)
        let _ = directionsArray.map { $0.cancel() }
    }
    
    
    @IBAction func goButtonTapped(_ sender: UIButton) {
          
        getDirections()
      
    }
        
     
    
          
        
}
      
    

    extension ForthViewController:CLLocationManagerDelegate{
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            // we will be back

            guard let location = locations.last else{return}
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)

            let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapview.setRegion(region, animated: true)

        }
        
        
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // we will be back
            checkLocationAuthorization()
        }
        
        
        
        
    }
extension ForthViewController:MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("%%%%%%%%%%%%%")
        let center = getCenterLocation(for: mapView)
        let geoCoder = CLGeocoder()
        guard let previousLocation = self.previousLocation else{return}
        guard center.distance(from: previousLocation) > 50 else { return }
        self.previousLocation = center
        geoCoder.reverseGeocodeLocation(center) { [weak self] (placemarks, error) in
        guard let self = self else { return }
        
        if let _ = error {
        //TODO: Show alert informing the user
        return
                    }
                    guard let placemark = placemarks?.first else {
                        //TODO: Show alert informing the user
                        return
        }
                let streetNumber = placemark.subThoroughfare ?? ""
                let streetName = placemark.thoroughfare ?? ""
            let country = placemark.country ?? ""
            
//                DispatchQueue.main.async {
//                self.addressLabel.text = "\(streetNumber) \(streetName) \(country)"
//
//            }
    }
}
    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
           let renderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        
           renderer.strokeColor = .blue
           
           return renderer
       }

    
}
