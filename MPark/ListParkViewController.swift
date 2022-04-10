//
//  ListParkViewController.swift
//  MPark
//
//  Created by Hasan Güzelmansur on 10.04.2022.
//

import UIKit

class ListParkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ParkListCell
        
        cell.parkPlatzLabel.text = "A7"
        cell.statusLabel.text = "Frei"
        
        return cell
        
    }

}
