//
//  RandomViewController.swift
//  Login App
//
//  Created by user on 13/09/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class RandomViewController: UIViewController {
    
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var emailId: UILabel!
    
    @IBOutlet weak var dateOfBirth: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.topItem?.title = "Random";
        
    }
    
    @IBAction func addRandomUser(_ sender: UIButton) {
        
        let Request: String = "https://randomuser.me/api/"
        
        guard let url = URL(string: Request) else {
            
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest, completionHandler: {(data:Data?, response: URLResponse? , error: Error?) -> Void in
            
            guard error == nil else {
                
                print("Error \(String(describing: error))")
                
                return
                
            }
            
            guard let responseData = data else {
                
                print("Response data is empty)")
                
                return
                
            }
            
            print("Response data \(responseData)")
            
            do {
                
                guard let jsonDictionary = try JSONSerialization.jsonObject(with: responseData, options: [] ) as? [String: AnyObject] else {
                    
                    return
                    
                }
                
                print("The data the user having is: \(jsonDictionary)")
                
                
                if let result = jsonDictionary["results"] as? [[String:Any]] {
                    
                    let  array = result[0]
                    
                    
                    
                    if let userName = array["name"] as? [String: String]  {
                        
                        if let firstName = userName["first"], let secondName = userName["last"], let title = userName["title"]  {
                            
                            self.name.text = "\(firstName + " " + secondName + " " + title)"
                            
                        }
                        
                    }
                    
                    if let email = array["email"] {
                        
                        self.emailId.text = email as? String
                        
                    }
                    
                    if let birthDate = array["dob"]  {
                        
                        self.dateOfBirth.text = birthDate as? String
                        
                    }
                    
                    if let image = array["picture"] as? [String: String] {
                        
                        for picture in image.keys {
                            
                            guard picture == "medium" else {
                                
                                continue
                                
                            }
                            if let mediumSizePicture = image["medium"] {
                                
                                if let url = URL(string: mediumSizePicture) {
                                
                                let data = try? Data(contentsOf: url)
                                
                                if let imageData = data {
                                    
                                    let mediumImage = UIImage(data: imageData)
                                    
                                    self.imageView.image = mediumImage
                                    
                                 //   (Void) setStyleCircleForImage: (UIView *)imageView {
                                    
                                    self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2
                                    
                                    
                                   // self.imageView.layer.cornerRadius = self.imageView.frame.size.height / 2
                                    

                                    
                                    self.imageView.clipsToBounds = true
                                    
                                    self.imageView.layer.borderColor = UIColor.white.cgColor
                                    
                                    self.imageView.layer.borderWidth = 3
                                        
                                   // }
                                }
                                    
                                }
                                
                            }
                            
                        }
                    }
                }
                
                
                
            } catch  {
                print("error trying to convert data to JSON")
                
                return
            }
        })
        
        task.resume()
        
        
        
    }
    
}
