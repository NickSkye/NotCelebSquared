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
    var delayTimes:[Int] = [9, 15, 8, 8, 17, 13, 24, 10, 30, 38]
    
    @IBOutlet var answerButt: UIButton!
    
    @IBOutlet var lobbyButt: UIButton!
    
    
    @IBOutlet var celebCharity: UILabel!
    var totalScore = Double()
    //@IBOutlet var nameLabel: UILabel!
    var celebrityCharity:[String] = ["Kim Kardashian playing for XYZ Charity", "Justin Timberlake playing for XYZ Charity", "Rihanna playing for XYZ Charity", "Ryan Reynolds playing for XYZ Charity", "Dwayne Johnson playing for XYZ Charity", "__________ playing for XYZ Charity", "Peyton Manning playing for XYZ Charity", "__________ playing for XYZ Charity", "Travis Pastrana playing for XYZ Charity", "Justin Bieber playing for XYZ Charity",]
    var youtubeUrl = "https://s3-us-west-1.amazonaws.com/celebsquaredvideos/videos/-Kim_Kardashian_West_In_Real_Life_Billboard_Cover_Shoot_Interview.mp4"
    
    var delayTime = 9
    
    var allVideos:[String] = ["https://s3-us-west-1.amazonaws.com/celebsquaredvideos/videos/-Kim_Kardashian_West_In_Real_Life_Billboard_Cover_Shoot_Interview.mp4",
                              "https://s3-us-west-1.amazonaws.com/celebsquaredvideos/videos/-Justin_Timberlake_and_Jessica_Biel_talking_about_each_other.mp4",
                              "https://s3-us-west-1.amazonaws.com/celebsquaredvideos/videos/-Rihanna_Jim_Parsons_Interview_Each_Other_for_Yahoo.mp4",
                              "https://s3-us-west-1.amazonaws.com/celebsquaredvideos/videos/Sandra_Bullock_and_Ryan_Reynolds_true_or_false_quiz-The_Proposal.mp4",
                              "https://s3-us-west-1.amazonaws.com/celebsquaredvideos/videos/-The_Rock_Talks_Ballers_and_Breakfast.mp4",
                              "https://s3-us-west-1.amazonaws.com/celebsquaredvideos/videos/-Hair_Color_Transformation_with_Huda_Beauty.mp4",
                              "https://s3-us-west-1.amazonaws.com/celebsquaredvideos/videos/-Mike_Klis_interviews_Peyton_Manning_after_White_House_visit.mp4",
                              "https://s3-us-west-1.amazonaws.com/celebsquaredvideos/videos/-Guess_who_this_is.mp4",
                              "https://s3-us-west-1.amazonaws.com/celebsquaredvideos/videos/-Travis_Pastrana_on_the_Fearless_Mindset_with_Lewis_Howes.mp4",
                              "https://s3-us-west-1.amazonaws.com/celebsquaredvideos/videos/-BBC_Radio_1_hangs_out_at_Justin_Biebers_House.mp4"]
    
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
            videoView.isHidden = true
            
            if videoCount < 9{
            videoCount += 1
             youtubeUrl = allVideos[videoCount]
                delayTime = delayTimes[videoCount]
            }

                celebCharity.text = celebrityCharity[videoCount]
//
            let videoURL = NSURL(string: youtubeUrl)
            player = AVPlayer(url: videoURL! as URL)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = self.view.bounds
            self.view.layer.addSublayer(playerLayer)
            player?.play()
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(delayTime) ) {
                self.player?.pause()
               // self.player?.replaceCurrentItem(with: nil)
                //self.player?.rate = 0.0
                
           //     self.player?.currentItem = AVPlayer()
                self.player = nil
                
                self.performSegue(withIdentifier: "answerEnter", sender: self)
          //      self.answerButt.isHidden = false
          //      self.lobbyButt.isHidden = false

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
    
    
    override func viewWillDisappear(_ animated: Bool) {
        player?.pause()
        
     //   player?.rate = 0.0
    //    player?.replaceCurrentItem(with: nil)
       // self.player?.currentItem = AVPlayer()
        player = nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        player?.pause()
      //  player?.replaceCurrentItem(with: nil)
      //  player?.rate = 0.0
        player = nil
        
       // self.player?.currentItem = AVPlayer()
        
        if segue.identifier == "answerEnter" {
            let DestViewController : AnswerScreen = segue.destination as! AnswerScreen
            
            // doSomething(sender as! UIButton)
            player = nil
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


    
