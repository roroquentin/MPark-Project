//
//  MapViewController.swift
//  MPark
//
//  Created by Hasan Güzelmansur on 3.04.2022.
//

import UIKit
import MapKit
import CoreLocation
import Firebase

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        addCostumPin()
        
        
        // Pinleme
        /*
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer:)))
        gestureRecognizer.minimumPressDuration = 2
        mapView.addGestureRecognizer(gestureRecognizer)
         */
        
        
    }
    
    private func  addCostumPin() {
       
       let pinPark = MKPointAnnotation()
       let pinLoc = CLLocationCoordinate2D(latitude: 41.14133, longitude: 29.102933)
       pinPark.coordinate = pinLoc
       pinPark.title = "TAÜ Parkplatz"
       pinPark.subtitle = "Testbereich"
       mapView.addAnnotation(pinPark)
       
   }
    
    // Pin için yardımcı fonksiyon
    /*
    @objc func chooseLocation(gestureRecognizer:UILongPressGestureRecognizer) {
        
        if gestureRecognizer.state == .began {
            
            let touchedPoint = gestureRecognizer.location(in: self.mapView)
            let touchedCoordinates = self.mapView.convert(touchedPoint, toCoordinateFrom: self.mapView)
            
            let annotaion = MKPointAnnotation()
            annotaion.coordinate = touchedCoordinates
            annotaion.title = "New Annotion"
            annotaion.subtitle = "Travel Book"
            self.mapView.addAnnotation(annotaion)
            
        }
        
    } */
    
    // Kullanı lokasyonununa göre haritayı konumlandırma
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.showsUserLocation = true
    
        mapView.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseID = "MyPin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseID) as? MKPinAnnotationView

        if pinView == nil {
            
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
            pinView?.canShowCallout = true

            let btnInfo = UIButton(type: UIButton.ButtonType.detailDisclosure)
            pinView?.rightCalloutAccessoryView = btnInfo
            
        }else {
            
            pinView?.annotation = annotation
            
        }
        
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        performSegue(withIdentifier: "toParkList", sender: nil)
        
    }
    
    func makeAlert(titleInput:String, messageInput:String) {
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }

}
