//
//  ListParkViewController.swift
//  MPark
//
//  Created by Hasan Güzelmansur on 10.04.2022.
//

import UIKit
import Firebase

class ListParkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var parkPlatzArray = [String]()
    var statusArray = [String]()
    var latitudeArray = [String]()
    var longitudeArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getDataFromFirestore()
        
    }
    
    func getDataFromFirestore() {
        
        let fireStoreDatabase = Firestore.firestore()
        
        fireStoreDatabase.collection("cams").addSnapshotListener { snapshot, error in
            
            if error != nil {
                
                self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error!")
                
            }else {
                
                if snapshot?.isEmpty != true && snapshot != nil {
                    
                    self.parkPlatzArray.removeAll(keepingCapacity: false)
                    self.statusArray.removeAll(keepingCapacity: false)
                    self.latitudeArray.removeAll(keepingCapacity: false)
                    self.longitudeArray.removeAll(keepingCapacity: false)
                    
                    for document in snapshot!.documents {
                        
                        if let parkplatz = document.get("parkplatz") as? String {
                            
                            self.parkPlatzArray.append(parkplatz)
                            
                        }
                        
                        if let status = document.get("status") as? String {
                            
                            self.statusArray.append(status)
                            
                        }
                        
                        if let latitude = document.get("latitude") as? String {
                            
                            self.latitudeArray.append(latitude)
                            
                        }
                        
                        if let longitude = document.get("longitude") as? String {
                            
                            self.longitudeArray.append(longitude)
                            
                        }
                        
                    }
                    
                    self.tableView.reloadData()
                    
                }
                
            }
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parkPlatzArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ParkListCell
        
        cell.parkPlatzLabel.text = String(parkPlatzArray[indexPath.row])
        cell.statusLabel.text = String(statusArray[indexPath.row])
        cell.latitudeLabel.text = String(latitudeArray[indexPath.row])
        cell.longitudeLabel.text = String(longitudeArray[indexPath.row])
        
        return cell
        
    }
    
    func makeAlert(titleInput:String, messageInput:String) {
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }

}
