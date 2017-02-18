//
//  StartScreen.swift
//  CelebritiesSquared
//
//  Created by Dori Mouawad on 2/17/17.
//  Copyright © 2017 Nick Hoyt. All rights reserved.
//

import UIKit

class StartScreen: UIViewController {
    var email = ""

    //Social Media button declarations
    @IBOutlet var snapchatButton: UIButton!
    @IBOutlet var twitterButton: UIButton!
    @IBOutlet var instagramButton: UIButton!
    @IBOutlet var facebookButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func facebookButton(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://www.facebook.com/CelebritiesSquared/?ref=aymt_homepage_panel")!)
    }

    @IBAction func instagramButton(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://www.instagram.com/celebritiessquared/")!)
    }
    
    @IBAction func twitterButton(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://twitter.com/CelebsSquared")!)
    }
    @IBAction func snapchatButton(_ sender: Any) {
        
    }
    
    @IBAction func mainlobbyButton(_ sender: Any) {
        performSegue(withIdentifier: "mainLobbySegue", sender: self)
    }
    @IBAction func howtoplayButton(_ sender: Any) {
        performSegue(withIdentifier: "howtoplaySegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "mainLobbySegue"{
            let DestViewController : SecondScreen = segue.destination as! SecondScreen
            DestViewController.email = email
        }
        else if segue.identifier == "howtoplaySegue"{
            let DestViewController : HowToPlayScreen = segue.destination as! HowToPlayScreen
            DestViewController.email = email
        }

}


}
