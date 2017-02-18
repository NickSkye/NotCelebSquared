//
//  HowToPlayScreen.swift
//  CelebritiesSquared
//
//  Created by Dori Mouawad on 2/18/17.
//  Copyright © 2017 Nick Hoyt. All rights reserved.
//

import UIKit

class HowToPlayScreen: UIViewController {
    var email = ""
    
    @IBOutlet var mainlobbyButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func mainlobbyClicked(_ sender: Any) {
        performSegue(withIdentifier: "htpMainLobbySegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "htpMainLobbySegue"{
            let DestViewController : SecondScreen = segue.destination as! SecondScreen
            DestViewController.email = email
        }
    }
 

}
