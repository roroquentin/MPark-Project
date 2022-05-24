//
//  ParkListCell.swift
//  MPark
//
//  Created by Hasan Güzelmansur on 10.04.2022.
//

import UIKit
import MapKit
import CoreLocation

class ParkListCell: UITableViewCell, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var parkPlatzLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    var annotationTitle = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func navigationBtn(_ sender: Any) {
        
        let requestLocation = CLLocation(latitude: 41.14077, longitude: 29.10313)
        
        CLGeocoder().reverseGeocodeLocation(requestLocation) { placemarks, error in
            
            if let placemark = placemarks {
             
                if placemark.count > 0 {
                    
                    let newPlacemark = MKPlacemark(placemark: placemark[0])
                    let item = MKMapItem(placemark: newPlacemark)
                    item.name = self.annotationTitle
                    let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
                    item.openInMaps(launchOptions: launchOptions)
                    
                }
                
            }
            
        }
        
    }
    
}
