//
//  AfterAnswer.swift
//  CelebritiesSquared
//
//  Created by Nick Hoyt on 9/26/16.
//  Copyright © 2016 Nick Hoyt. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class AfterAnswer: UIViewController {
    
    // @IBOutlet var videoView: UIWebView!
    
    
   // @IBOutlet var videoView: UIWebView!
    
  //  var timer = NSTimer()
  //  var count = 10.00
     var timer = Timer()
    var count = 3
    
    @IBOutlet var timeLabel: UILabel!
 //   @IBOutlet var timerLabel: UILabel!
    var userName = ""
  //  @IBOutlet var scoreLabel: UILabel!
    var totalScore = Double()
 //   @IBOutlet var nameLabel: UILabel!
    var passedName = "ERROR"
    var passedAnswerBool = false
    var videoCount = 0 
    var youtubeUrl = "https://www.youtube.com/embed/hKkklMJ_4I4"
   // https://www.youtube.com/embed/3NvcjdK32Lg?rel=0&amp;controls=0&amp;showinfo=0?&start=129&end=133
    var allVideos:[String] = ["https://www.youtube.com/embed/QO-Iu9ANsTI?rel=0&amp;controls=0&amp;showinfo=0?&start=39&end=43", "https://www.youtube.com/embed/EPX8lOveo34?rel=0&amp;controls=0&amp;showinfo=0?&start=365&end=405",
        "https://www.youtube.com/embed/GNyxtJQr26I?rel=0&amp;controls=0&amp;showinfo=0?&start=132&end=162",
        "https://www.youtube.com/embed/3NvcjdK32Lg?rel=0&amp;controls=0&amp;showinfo=0?&start=133&end=159", //4
        "https://www.youtube.com/embed/zIrLJ0cuE2Q?rel=0&amp;controls=0&amp;showinfo=0?&start=109&end=136", //5
        "https://www.youtube.com/embed/jG-1WXVUWBc?rel=0&amp;controls=0&amp;showinfo=0?&start=7&end=16",    //6
        "https://www.youtube.com/embed/E5bds9Ziu9c?rel=0&amp;controls=0&amp;showinfo=0?&start=55&end=96",   //7
        "https://www.youtube.com/embed/HS2hU_1p9K0?rel=0&amp;controls=0&amp;showinfo=0?&start=0&end=3",     //8
        "https://www.youtube.com/embed/IA8cyo5QpdU?rel=0&amp;controls=0&amp;showinfo=0?&start=26&end=47",    //9
        "https://www.youtube.com/embed/8Xg7qr-bb9w?rel=0&amp;controls=0&amp;showinfo=0?&start=33&end=44"]    //10
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(AfterAnswer.update), userInfo: nil, repeats: true)
        
        if videoCount < 10{
           // videoCount++
            youtubeUrl = allVideos[videoCount]
        }
        
       // let localVideo = URL(fileURLWithPath: "/Users/nickhoyt/Downloads/test_video.mp4")
/*        videoView.allowsInlineMediaPlayback = true
        videoView.mediaPlaybackRequiresUserAction = false
        videoView.scrollView.isScrollEnabled = false
        videoView.loadHTMLString("<iframe width=\"\(videoView.frame.width-15)\" height=\"\(videoView.frame.height-15)\" src=\"\(youtubeUrl)?&playsinline=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: URL(string: youtubeUrl)) //NSURL(string: youtubeUrl)
      */
 /*       if passedAnswerBool {
            nameLabel.text = "CORRECT"
            
        }
        else {
            nameLabel.text = "WRONG"
        }
 */
       // scoreLabel.text = String((Double(round(1000*totalScore)/1000))) + " out of a possible " + String((videoCount+1) * 10) + " points."
        
    }
    
    func update() {
        
        if(count > 0)
        {
            
            timeLabel.text = String(count)
            count = count - 1
        } else {
            timer.invalidate()
            if(videoCount == 9){
                performSegue(withIdentifier: "lastQuestion", sender: self)
            }
            else{
                performSegue(withIdentifier: "notLast", sender: self)
            }
            //           let Second:UIViewController = SecondScreen()
            ////
            //           self.presentViewController(Second, animated: true, completion: nil) // this one line performs segue
        }}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "lastQuestion" {
            let DestViewController : LeaderBoardScreen = segue.destination as! LeaderBoardScreen
            // doSomething(sender as! UIButton)
            DestViewController.totalScore = totalScore
            DestViewController.userName = userName
            //videoView.loadHTMLString("", baseURL: nil)
            
        }
        if segue.identifier == "notLast" {
            let DestViewController : ContestOverScreen = segue.destination as! ContestOverScreen
            DestViewController.videoCount = videoCount
            DestViewController.totalScore = totalScore
            DestViewController.userName = userName
          //  videoView.loadHTMLString("", baseURL: nil)
        }
    }
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
 /*       @IBAction func nextQuestion(_ sender: AnyObject) {
            print(videoCount)
            if videoCount == 9 {
                performSegue(withIdentifier: "lastQuestion", sender: self)
            }
            else{
                performSegue(withIdentifier: "notLast", sender: self)
            }
           // performSegueWithIdentifier("lastQuestion", sender: self)
        }
*/
    
    }
    

