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
    
    @IBOutlet var emailField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
    
    var responseString = ""
    var allowed = false
    var email : String = ""
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
        email = emailField.text!
        var password : String = passwordField.text!
        
        
        var request = URLRequest(url: URL(string: "http://dev.celebritiessquared.com/CSPhp/SignIn.php")!)
        
        request.httpMethod = "POST"
        
        var postString: String!
        postString = "email=\(email)&password=\(password)"
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
            
            self.responseString = String(data: data, encoding: .utf8)!
            print("responseString = \(self.responseString)")
            
        }
        checkResponseString()
        task.resume()
        
    }
    
    ///////////////////
    
    func checkResponseString(){
        print(allowed)
        if(self.responseString == "Success"){
            allowed = true
            
        }
        else{
            allowed = false
        }
    }
    
    ///////////////////
    
    
    @IBAction func loginButton(_ sender: Any) {
        //check with database and change segue to be done programattically so that it confirms the login before going.
        postToServerFunction()
        print("ALLOWED CHECKED")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            if(self.allowed || self.responseString == "Success"){ //put if username = username from db and password = password from db then it does segue.
                self.performSegue(withIdentifier: "loginSegue", sender: self)
                
            }
            else {
                
                let alert=UIAlertController(title: "Oops!", message: "Email or Password is incorrect", preferredStyle: UIAlertControllerStyle.alert);
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil));
                //show it
                self.show(alert, sender: self);
                
                
                
            }
        } //this is the semicolon
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginSegue" {
            
            let DestViewController : SecondScreen = segue.destination as! SecondScreen
            // doSomething(sender as! UIButton)
            
            DestViewController.email = email
        }
        
}
}
