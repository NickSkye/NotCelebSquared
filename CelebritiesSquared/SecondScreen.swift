//
//  SecondScreen.swift
//  CelebritiesSquared
//
//  Created by Nick Hoyt on 8/19/16.
//  Copyright © 2016 Nick Hoyt. All rights reserved.
//

//import Foundation
import UIKit

class SecondScreen: UIViewController {
    
    
    
    
//    @IBAction func contestLobbyButton(sender: AnyObject) {
//       var alert = UIAlertController(title: "ALERT", message: "Enter Username", preferredStyle: UIAlertControllerStyle.Alert)
//      
//        
//       self.presentViewController(alert, animated: true, completion: nil)
//
//    }
    var userName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        var Alert:UIAlertView = UIAlertView(title: "Test", message: ", delegate: self, cancelButtonTitle: "OK")
//        Alert.show()
        //1. Create the alert controller.
        print(userName)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func facebookButton(_ sender: AnyObject) {
        didTapFacebook(sender)
    }
    
    @IBAction func instagramButton(_ sender: AnyObject) {
        didTapInstagram(sender)
    }
    
    @IBAction func twitterButton(_ sender: AnyObject) {
        didTapTwitter(sender)
    }
    
    @IBAction func didTapFacebook(_ sender: AnyObject) {
        UIApplication.shared.openURL(URL(string: "https://www.facebook.com/CelebritiesSquared/?ref=aymt_homepage_panel")!)
    }
    
    @IBAction func didTapInstagram(_ sender: AnyObject) {
        UIApplication.shared.openURL(URL(string: "https://www.instagram.com/celebritiessquared/")!)
    }

    
    @IBAction func didTapTwitter(_ sender: AnyObject) {
        UIApplication.shared.openURL(URL(string: "https://twitter.com/CelebsSquared")!)
    }
    


    @IBAction func fundraiserButt(_ sender: Any) {
        
        print("GAY")
        performSegue(withIdentifier: "fundraiserLobbySegue", sender: self)
        
    }
    
    @IBAction func contestButt(_ sender: Any) {
        performSegue(withIdentifier: "contestLobbySegue", sender: self)
    }
    
    
   
    
    @IBAction func tvQualifier(_ sender: AnyObject) {
        let Alert:UIAlertView = UIAlertView(title: "Oops!", message: "You have not earned enough Celebrities Squared Points to open qualifying rounds for a chance to play on the Celebrities Squared TV Game Show :)", delegate: self, cancelButtonTitle: "OK")
        Alert.show()
    }
    
    @IBAction func instructionButt(_ sender: AnyObject) {
        let Alert:UIAlertView = UIAlertView(title: "How To Play", message: "1. Choose a Contest from the Contest Lobby. \n\n 2. Start a Contest. \n\n 3. Answer the questions as correct and fast as possible within 10 seconds once the question appears. \n\n 4. Your point total will be calculated and appear on the contest leaderboard. \n\n 5. If there is a contest tie for first place, a tiebreaker(s) contest will be played until there is one winner.", delegate: self, cancelButtonTitle: "OK")
        Alert.show()
    }
    
    @IBAction func disclaimerButton(_ sender: AnyObject) {
        let Alert:UIAlertView = UIAlertView(title: "Disclaimer", message: "None of the Celebrities or Merchandisers have agreed to participate with Celebrities Squared App in anyway which so ever at this time. This Beta App is for Demonstration Purposes Only. The Celebrities Squared Beta App is not for distribution. As a user you were offered an opportunity to play by Celebrities Squared and only you are to play the Demo Game.", delegate: self, cancelButtonTitle: "OK")
        Alert.show()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contestLobbySegue" {
            let DestViewController : ThirdScreen = segue.destination as! ThirdScreen
            // doSomething(sender as! UIButton)
            DestViewController.userName = userName
            
        }
        else if segue.identifier == "fundraiserLobbySegue" {
            let DestViewController : FundraiserScreen = segue.destination as! FundraiserScreen
            DestViewController.userName = userName
        }
        
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        var DestViewController : ThirdScreen = segue.destinationViewController as! ThirdScreen
//        //doSomething(sender as! UIButton)
//        //DestViewController.userName = userName
//        //performSegueWithIdentifier("threeToGame", sender: self)
//        
//    }
    

}

