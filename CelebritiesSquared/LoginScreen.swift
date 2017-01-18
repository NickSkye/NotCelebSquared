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
    
    @IBAction func loginButton(_ sender: Any) {
        //check with database and change segue to be done programattically so that it confirms the login before going.
    }
    
    
    
}
