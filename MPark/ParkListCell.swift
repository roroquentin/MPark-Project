//
//  ParkListCell.swift
//  MPark
//
//  Created by Hasan Güzelmansur on 10.04.2022.
//

import UIKit

class ParkListCell: UITableViewCell {

    @IBOutlet weak var parkPlatzLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func navigationBtn(_ sender: Any) {
        
        
        
    }
    
}
