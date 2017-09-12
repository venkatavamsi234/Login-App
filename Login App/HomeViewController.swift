//
//  HomeViewController.swift
//  Login App
//
//  Created by User on 11/09/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

 
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var emailIdLabel: UILabel!
    
    var greetingMessage = ""
    
    var emailId = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        displayLabel.text = greetingMessage
        
        emailIdLabel.text = emailId
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.topItem?.title = "Home";
        
        if let name = UserDefaults.standard.string(forKey: "name") {
            
            displayLabel.text = "Hi, \(name) welcome to iOS"
            
        }
        
        if let id = UserDefaults.standard.string(forKey: "id") {
            
            emailIdLabel.text =  id
            
        }
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
    }
    
    


    



}
