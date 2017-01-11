//
//  contestOverScreen.swift
//  CelebritiesSquared
//
//  Created by Nick Hoyt on 9/12/16.
//  Copyright © 2016 Nick Hoyt. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ContestOverScreen: UIViewController {
    
    @IBOutlet var videoView: UIWebView!
    //var timer = NSTimer()
    var count = 10.00
    var userName = ""
    
    @IBOutlet var answerButt: UIButton!
    
    @IBOutlet var lobbyButt: UIButton!
    
    
    @IBOutlet var celebCharity: UILabel!
    var totalScore = Double()
    //@IBOutlet var nameLabel: UILabel!
    var celebrityCharity:[String] = ["Kim Kardashian playing for XYZ Charity", "Justin Timberlake playing for XYZ Charity", "Rihanna playing for XYZ Charity", "Ryan Reynolds playing for XYZ Charity", "Dwayne Johnson playing for XYZ Charity", "__________ playing for XYZ Charity", "Peyton Manning playing for XYZ Charity", "__________ playing for XYZ Charity", "Travis Pastrana playing for XYZ Charity", "Justin Bieber playing for XYZ Charity",]
    var youtubeUrl = "https://www.youtube.com/embed/QO-Iu9ANsTI?rel=0"
    //
    var allVideos:[String] = ["https://www.youtube.com/embed/QO-Iu9ANsTI?rel=0&amp;controls=0&amp;showinfo=0?&start=34&end=39", "https://www.youtube.com/embed/EPX8lOveo34?rel=0&amp;controls=0&amp;showinfo=0?&start=354&end=365", "https://www.youtube.com/embed/GNyxtJQr26I?rel=0&amp;controls=0&amp;showinfo=0?&start=128&end=132", "https://www.youtube.com/embed/3NvcjdK32Lg?rel=0&amp;controls=0&amp;showinfo=0?&start=129&end=133", "https://www.youtube.com/embed/zIrLJ0cuE2Q?rel=0&amp;controls=0&amp;showinfo=0?&start=96&end=109", "https://www.youtube.com/embed/jG-1WXVUWBc?rel=0&amp;controls=0&amp;showinfo=0?&start=0&end=9", "https://www.youtube.com/embed/E5bds9Ziu9c?rel=0&amp;controls=0&amp;showinfo=0?&start=35&end=55", "https://www.youtube.com/embed/TNX1offtKj0?rel=0&amp;controls=0&amp;showinfo=0", "https://www.youtube.com/embed/IA8cyo5QpdU?rel=0&amp;controls=0&amp;showinfo=0?&start=0&end=26", "https://www.youtube.com/embed/8Xg7qr-bb9w?rel=0&amp;controls=0&amp;showinfo=0?&start=0&end=34"]
    
    var tenQuestions:[String] = ["Question: What's your dream job?", "Question: Which girlfriend is Justin Timberlake kissing?", "Question: What Skill or Talent would you like to learn?","Question: Ryan Reynolds has Four Sisters?","Question: Is it true you would seriously run for President of the United States of America?","Question: Can you name who this person is?","Question: President Obama called Peyton Manning after he lost the 2009 Super Bowl giving him his condolences on the lose?","Question: Who is this woman?","Question: What is the longest you have gone professionally with out a injury?","Question: When you are home what is a typical chilling day?"]
    var videoCount = -1 //this var will keep track of which video to play next
    
    var passedName = "ERROR"
    var player:AVPlayer?
    
    @IBOutlet var timerLabel: UILabel!
    
        override func viewDidLoad() {
            super.viewDidLoad()
           // timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
            
            
            answerButt.isHidden = true
            lobbyButt.isHidden = true
            
            if videoCount < 9{
            videoCount += 1
             youtubeUrl = allVideos[videoCount]
            }

                celebCharity.text = celebrityCharity[videoCount]
//
            let videoURL = NSURL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
            player = AVPlayer(url: videoURL! as URL)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = self.view.bounds
            self.view.layer.addSublayer(playerLayer)
            player?.play()
            DispatchQueue.main.asyncAfter(deadline: .now() + 12) {
                self.player?.pause()
                self.answerButt.isHidden = false
                self.lobbyButt.isHidden = false

            }
            
//    
////            let localVideo = URL(fileURLWithPath: "/Users/nickhoyt/Downloads/test_video.mp4")
//            videoView.allowsInlineMediaPlayback = true
//            videoView.mediaPlaybackRequiresUserAction = false
//            videoView.scrollView.isScrollEnabled = false
//            videoView.center = self.view.center
////            videoView.scrollView.contentScaleFactor = 100
//            //videoView.scrollView.center = videoView.center
//            videoView.loadHTMLString("<iframe width=\"\(videoView.frame.width)\" height=\"\(videoView.frame.height)\" src=\"\(youtubeUrl)&playsinline=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: URL(string: youtubeUrl)) //NSURL(string: youtubeUrl)
   
            
        }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    func update(){
//        if videoView.loading == true{
//            nameLabel.text = "Not Done"
//        }
//        else{
//            nameLabel.text = passedName
//        }
//    }
    
//    func update() {
//        
//        if(count > 0)
//        {
//            
//            timerLabel.text = String(format: "%.02f",count)
//            count = count - 0.02
//        } else {
//            timer.invalidate()
//            performSegueWithIdentifier("timeOut", sender: self)
//            //           let Second:UIViewController = SecondScreen()
//            ////
//            //           self.presentViewController(Second, animated: true, completion: nil) // this one line performs segue
//        }}
//
    
//    @IBAction func yesButton(sender: AnyObject) {
//        //timerLabel.text = String(format: "%.02f",count)
//        //timer.invalidate()
//      //  performSegueWithIdentifier("timeOut", sender: self)
//    }
    
    override func viewWillDisappear(_ animated: Bool) {
        player?.pause()
        player?.rate = 0.0
        player?.replaceCurrentItem(with: nil)
        
        player = nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        player?.pause()
        player?.replaceCurrentItem(with: nil)
        player?.rate = 0.0
        player = nil
        
        if segue.identifier == "answerEnter" {
            let DestViewController : AnswerScreen = segue.destination as! AnswerScreen
            
            // doSomething(sender as! UIButton)
            DestViewController.player = player
            DestViewController.passedName = passedName
            DestViewController.totalScore = totalScore
            DestViewController.videoCount = videoCount
            DestViewController.userName = userName
            videoView.loadHTMLString("", baseURL: nil)
            
            
        }
    }
    
// 
//    
//    private var firstAppear = true
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        if firstAppear {
//            do {
//                try playVideo()
//                firstAppear = false
//            } catch AppError.InvalidResource(let name, let type) {
//                debugPrint("Could not find resource \(name).\(type)")
//            } catch {
//                debugPrint("Generic error")
//            }
//            
//        }
//    }
//    
//    private func playVideo() throws {
//        guard let path = NSBundle.mainBundle().pathForResource("test_video", ofType:"mp4") else {
//           throw AppError.InvalidResource("test_video", "mp4")
//        }
//        
//        let player = AVPlayer(URL: NSURL(fileURLWithPath: path))
//        let playerController = AVPlayerViewController()
//        playerController.player = player
//        self.presentViewController(playerController, animated: true) {
//            player.play()
//        }
//    }
//}
//
//enum AppError : ErrorType {
//    case InvalidResource(String, String)
}


    
