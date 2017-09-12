//
//  SettingsViewController.swift
//  Login App
//
//  Created by User on 11/09/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.topItem?.title = "Settings";
        
    }
    
    @IBAction func redirectingMethod(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "UIAlertController", message: "Would you like to signOut", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: signOut))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func signOut(action: UIAlertAction)  {
        
        UserDefaults.standard.removeObject(forKey: "name")
        UserDefaults.standard.removeObject(forKey: "id")
        
        guard  let  VC = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {
            
            return
            
        }
        
        navigationController?.pushViewController(VC, animated: true)
        
    }
    
}
