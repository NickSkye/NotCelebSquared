//
//  LoginScreen.swift
//  CelebritiesSquared
//
//  Created by Nick Hoyt on 1/17/17.
//  Copyright © 2017 Nick Hoyt. All rights reserved.
//

import Foundation
import UIKit

class LoginScreen: UIViewController {
    
    
    
    @IBOutlet var usernameField: UITextField!
   
    @IBOutlet var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func postToServerFunction(){
        //Contingency Handling. Error handling etc.
        var username : String = usernameField.text!
        var password : String = passwordField.text!
        
        
        var request = URLRequest(url: URL(string: "http://celebritiessquared.com/CSPhp/SignIn.php")!)
        
        request.httpMethod = "POST"
        
        var postString: String!
        postString = "username=\(username)&password=\(password)"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
            
        }
        task.resume()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        //check with database and change segue to be done programattically so that it confirms the login before going.
        
        postToServerFunction()
        
    }
    
    
    
}
