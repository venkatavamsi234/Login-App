//
//  TabBarViewController.swift
//  Login App
//
//  Created by User on 11/09/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        
        
               self.navigationItem.setHidesBackButton(true, animated: false)
        
    }
    
}
