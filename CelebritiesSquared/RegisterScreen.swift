//
//  RegisterScreen.swift
//  CelebritiesSquared
//
//  Created by Nick Hoyt on 1/17/17.
//  Copyright © 2017 Nick Hoyt. All rights reserved.
//

import Foundation
import UIKit

class RegisterScreen: UIViewController {
    
    @IBOutlet var first: UITextField!
    
    @IBOutlet var last: UITextField!
    
    
    @IBOutlet var usernameField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
    
    
    @IBOutlet var confirmPasswordField: UITextField!
    
    
    @IBOutlet var emailField: UITextField!
    
    @IBOutlet var phoneField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func postToServerFunction(){
        //Contingency Handling. Error handling etc.
        var firstName : String = first.text!
        var lastName : String = last.text!
        var username : String = usernameField.text!
        var password : String = passwordField.text!
        var confirmPassword : String = confirmPasswordField.text!
        var email : String = emailField.text!
        var phoneNumber : String = phoneField.text!
        
        
        var request = URLRequest(url: URL(string: "http://celebritiessquared.com/CSPhp/Register.php")!)
        
        request.httpMethod = "POST"
        
        print(password)
        
        var postString: String!
        postString = "first=\(firstName)&last=\(lastName)&username=\(username)&password=\(password)&email=\(email)"
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButton(_ sender: Any) {
        //send shit to database here
        //change segue to programattically seque if registration passes
        
        postToServerFunction()
        
        
        
    }
    
    
    
    
    
}
