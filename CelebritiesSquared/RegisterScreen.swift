//
//  RegisterScreen.swift
//  CelebritiesSquared
//
//  Created by Nick Hoyt on 1/17/17.
//  Copyright © 2017 Nick Hoyt. All rights reserved.
//

import Foundation
import UIKit

class RegisterScreen: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var first: UITextField!
    @IBOutlet var last: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var confirmPasswordField: UITextField!
    @IBOutlet var emailField: UITextField!
    var responseString = ""
    var allowed = false
    var email : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.first.delegate = self
        self.last.delegate = self
        self.passwordField.delegate = self
        self.confirmPasswordField.delegate = self
        self.emailField.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === first{
            last.becomeFirstResponder()
        }
        else if textField === last{
            emailField.becomeFirstResponder()
        }
        else if textField === emailField{
            passwordField.becomeFirstResponder()
        }
        else if textField === passwordField{
            confirmPasswordField.becomeFirstResponder()
        }
        else if textField === confirmPasswordField{
            confirmPasswordField.resignFirstResponder()
        }
        else{
            return false
        }
        
        return true
    }
    
    
    
    func postToServerFunction(){
        //Contingency Handling. Error handling etc.
        var firstName : String = first.text!
        var lastName : String = last.text!
        var password : String = passwordField.text!
        var confirmPassword : String = confirmPasswordField.text!
        email = emailField.text!
        
        if(password == confirmPassword){
            var request = URLRequest(url: URL(string: "http://dev.celebritiessquared.com/CSPhp/Register.php")!)
            
            request.httpMethod = "POST"
            
            var postString: String!
            postString = "first=\(firstName)&last=\(lastName)&email=\(email)&password=\(password)"
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
        }else{
            print("Passwords not equal")
            return
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func checkResponseString(){
        print(allowed)
        if(responseString == "Success"){
            allowed = true
            
        }
        else{
            allowed = false
        }
    }
    
    @IBAction func registerButton(_ sender: Any) {
        //send shit to database here
        //change segue to programattically seque if registration passes
        
        postToServerFunction()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if(self.responseString == "Success" || self.allowed){ //put if username = username from db and password = password from db then it does segue.
                self.performSegue(withIdentifier: "registerSegue", sender: self)
                
            }
            else {
                let alert=UIAlertController(title: "Oops!", message: "Some items appear not to be filled out :(", preferredStyle: UIAlertControllerStyle.alert);
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil));
                //show it
                self.show(alert, sender: self);
                /*
                 let Alert:UIAlertView = UIAlertView(title: "Oops!", message: "Username or Password is incorrect", delegate: self, cancelButtonTitle: "OK")
                 Alert.show()
                 */
                
            }
        }
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "registerSegue" {
            let DestViewController : StartScreen = segue.destination as! StartScreen
            // doSomething(sender as! UIButton)
            
            DestViewController.email = email
        }
        
    }
    
    
    
    
    
}

