//
//  ViewController.swift
//  Login App
//
//  Created by User on 11/09/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var emailId: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Login Page"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    
    
    @IBAction func loginMethod(_ sender: Any) {
        
        guard let tempUserName = userName.text, !tempUserName.isEmpty, let provideEmailId = emailId.text, isValidEmailAddress(emailAddress: provideEmailId) else {
            
            return label.text = "Please Enter Valid Credentials "
            
        }
        
        let userDefault = UserDefaults.standard
        userDefault.set(tempUserName, forKey: "name")
        userDefault.set(provideEmailId, forKey: "id")
        
        UserDefaults.standard.synchronize()
        
        
        if let  myTabVC = storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController
            
        {
            
            navigationController?.pushViewController(myTabVC, animated: true)
        }
        
    }
    
    func isValidEmailAddress(emailAddress: String?) -> Bool {
        
        guard let emailId = emailAddress, !emailId.isEmpty else {
            return false
        }
        
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: emailAddress)
        
    }
    
}






