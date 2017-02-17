//
//  AnswerScreen.swift
//  CelebritiesSquared
//
//  Created by Nick Hoyt on 9/24/16.
//  Copyright © 2016 Nick Hoyt. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class AnswerScreen: UIViewController {
    
   // @IBOutlet var videoView: UIWebView!
    
    @IBOutlet var videoView: UIWebView!
    
    var timer = Timer()
    var count = 10.00
    var email = ""
    var totalScore = Double()
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    var videoCount = 0 
    var passedName = "ERROR"
    var correctAnswerSegue = "A"
    var player:AVPlayer?
    
    @IBOutlet var answerOne: UILabel!
    
    @IBOutlet var answerTwo: UILabel!
    
 
    @IBOutlet var answerThree: UILabel!
    
    
    @IBOutlet var answerFour: UILabel!
    
    
    @IBOutlet var buttonC: UIButton!
    
    @IBOutlet var buttonD: UIButton!
    
    var tenQuestions:[String] = ["Question: What's your dream job?", "Question: Which girlfriend is Justin Timberlake kissing?", "Question: What Skill or Talent would you like to learn?","Question: Question: Ryan Reynolds has Four Sisters?","Question: Is it true you would seriously run for President of the United States of America?","Question: Can you name who this person is?","Question: President Obama called Peyton Manning after he lost the 2009 Super Bowl giving him his condolences on the lose?","Question: Who is this woman?","Question: What is the longest you have gone professionally with out a injury?","Question: When you are home what is a typical chilling day?"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(AnswerScreen.update), userInfo: nil, repeats: true)
        player?.replaceCurrentItem(with: nil)
       player?.pause()
        player = nil
        nameLabel.text = tenQuestions[videoCount]
        if(videoCount == 4){
            
        }
        
        videoAnswerSwitch(videoCount)
        //print(videoCount)
      //  nameLabel.text = passedName
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func videoAnswerSwitch(_ count: Int){
        switch(count){
        case 0:
            correctAnswerSegue = "A"
            answerOne.text = "Forensic Investigator"
            answerTwo.text = "Professional Singer"
            answerThree.text = "Pediatric Doctor"
            answerFour.text = "Professional Racecar Driver"
            break
        case 1:
            correctAnswerSegue = "C"
            answerOne.text = "Olivia Wild"
            answerTwo.text = "Lindsay Lohan"
            answerThree.text = "Jessica Biel"
            answerFour.text = "Scarlett Johansson"
            break
        case 2:
            correctAnswerSegue = "C"
            answerOne.text = "To Swim"
            answerTwo.text = "To Play Guitar"
            answerThree.text = "To Whistle"
            answerFour.text = "To Fly A Plane"
            break
        case 3:
            correctAnswerSegue = "B"
            answerOne.text = "TRUE"
            answerTwo.text = "FALSE"
            answerThree.text = ""
            answerFour.text = ""
            buttonC.isHidden = true
            buttonD.isHidden = true
            break
        case 4:
            correctAnswerSegue = "A"
            answerOne.text = "TRUE"
            answerTwo.text = "FALSE"
            answerThree.text = ""
            answerFour.text = ""
            buttonC.isHidden = true
            buttonD.isHidden = true
            break
        case 5:
            correctAnswerSegue = "D"
            answerOne.text = "Kourtney Kardashian"
            answerTwo.text = "Mila Kunis"
            answerThree.text = "Katie Holmes"
            answerFour.text = "Huda Beauty Kattan"
            
            break
        case 6:
            correctAnswerSegue = "A"
            answerOne.text = "TRUE"
            answerTwo.text = "FALSE"
            answerThree.text = ""
            answerFour.text = ""
            buttonC.isHidden = true
            buttonD.isHidden = true
            break
        case 7:
            correctAnswerSegue = "C"
            answerOne.text = "Maggie Q - Actress in Nikita"
            answerTwo.text = "Tao Okamoto - Actress in The Wolverine"
            answerThree.text = "Joy Cho - Influencer on Pinterest"
            answerFour.text = "Lisa Ling - the View TV Talk Show Host"
            break
        case 8:
            correctAnswerSegue = "C"
            answerOne.text = "6 Months"
            answerTwo.text = "2 years"
            answerThree.text = "A little over a year"
            answerFour.text = "Never, he's always had some type of injury"
            break
        case 9:
            correctAnswerSegue = "D"
            answerOne.text = "Sleep"
            answerTwo.text = "Have friends over and barbecue"
            answerThree.text = "Play video games"
            answerFour.text = "Go in the pool or go fishing"
            break
        default:
            break
            
            
        }
    }
    
    func update() {
        
        if(count > 0)
        {
            
            timerLabel.text = String(format: "%.02f",count)
            count = count - 0.02
        } else {
            timer.invalidate()
            performSegue(withIdentifier: "afterAnswer", sender: self)
            //           let Second:UIViewController = SecondScreen()
            ////
            //           self.presentViewController(Second, animated: true, completion: nil) // this one line performs segue
        }}
    
    //connect cbutton and dbutton and give them same abilities
    //randomize which one is the right answer button.
    @IBAction func yesButton(_ sender: AnyObject) {
       // timerLabel.text = String(format: "%.02f",count)
        timer.invalidate()
        //totalScore += count
        print(totalScore)
        
    }
    
    @IBAction func noButton(_ sender: AnyObject) {
        timer.invalidate()
        //timerLabel.text = String(format: "%.02f",count)
       
    }
    
    // ctrl drag each wrong button to next screen and name it wrongAnswer.
    // make an if statement up above to change the buttons depending on which video it is
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "afterAnswer" {
            let DestViewController : AfterAnswer = segue.destination as! AfterAnswer
            // doSomething(sender as! UIButton)
            DestViewController.passedName = passedName
            DestViewController.passedAnswerBool = false
            DestViewController.videoCount = videoCount
            DestViewController.totalScore = totalScore
            DestViewController.email = email
        }
        else if segue.identifier != correctAnswerSegue {
            let DestViewController : AfterAnswer = segue.destination as! AfterAnswer
            // doSomething(sender as! UIButton)
            DestViewController.passedName = passedName
            DestViewController.passedAnswerBool = false
            DestViewController.videoCount = videoCount
            DestViewController.totalScore = totalScore
            DestViewController.email = email
        }
        else if segue.identifier == correctAnswerSegue {
            let DestViewController : AfterAnswer = segue.destination as! AfterAnswer
            // doSomething(sender as! UIButton)
            DestViewController.passedName = passedName
            DestViewController.passedAnswerBool = true
            totalScore += count
            DestViewController.totalScore = totalScore
            DestViewController.videoCount = videoCount
            DestViewController.email = email
        }
    }
    
//    @IBAction func yesButton(sender: AnyObject) {
//        timerLabel.text = String(format: "%.02f",count)
//        timer.invalidate()
//        //  performSegueWithIdentifier("timeOut", sender: self)
//    }
    
//    @IBAction func noButton(sender: AnyObject) {
//        timer.invalidate()
//        timerLabel.text = "10.00"
//    }

    
   
}
