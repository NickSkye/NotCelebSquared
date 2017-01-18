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
    
    
    @IBOutlet var usernameField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
    
    
    @IBOutlet var confirmPasswordField: UITextField!
    
    
    @IBOutlet var emailField: UITextField!
    
    @IBOutlet var phoneField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButton(_ sender: Any) {
        //send shit to database here
        //change segue to programattically seque if registration passes
    }
    
    
    
}
