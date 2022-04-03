//
//  AccountViewController.swift
//  MPark
//
//  Created by Hasan Güzelmansur on 3.04.2022.
//

import UIKit

class AccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toLogin", sender: nil)
        
    }
    


}
