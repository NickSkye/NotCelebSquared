//
//  FundraiserScreen.swift
//  CelebritiesSquared
//
//  Created by Nick Hoyt on 2/2/17.
//  Copyright © 2017 Nick Hoyt. All rights reserved.
//
import UIKit
class FundraiserScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Data model: These strings will be the data for the table view cells
    let animals: [String] = ["Fundraiser One", "Coming Soon", "Coming Soon", "Coming Soon", "Coming Soon", "Coming Soon", "Coming Soon", "Coming Soon", "Coming Soon", "Coming Soon", "Coming Soon", "Coming Soon", "Coming Soon", "Coming Soon", "Coming Soon", "Coming Soon", "Coming Soon", "Coming Soon", "Coming Soon", "Coming Soon", "Coming Soon", "Coming Soon", "Coming Soon", "Coming Soon", "Coming Soon"]
    
    var userName = "DICK"
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    // don't forget to hook this up from the storyboard
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: CGRect(x: 0 , y: 0 , width: UIScreen.main.bounds.size.width, height: 50))
        label.center.x = self.view.center.x
        label.text = "Fundraisers"
        label.textAlignment = .center
        tableView.addSubview(label)
        //tableView.center.x = self.view.center.x
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 65))
        self.tableView.tableHeaderView?.backgroundColor = UIColor.red
        
        ///////////////////////////////////////////////////////////////////////////////////
        ///////////////////BACK BUTTON////////////////////////////////////////////////////
      
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
       // button.backgroundColor = UIColor.blue
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        tableView.addSubview(button)
        
        
    //////////////////////////////////BACK BUTTON END//////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////
    }
    func backButtonTapped(){
        self.performSegue(withIdentifier: "backFromFund", sender: self)
        print("Button pressed")
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animals.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
       
        // set the text from the data model
        cell.textLabel?.text = self.animals[indexPath.row]
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        self.performSegue(withIdentifier: "fundraiserToGame", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //MusicHelper.sharedHelper.stopBackgroundMusic()
        if segue.identifier == "backFromFund" {
            var DestViewController : SecondScreen = segue.destination as! SecondScreen
            // doSomething(sender as! UIButton)
            // DestViewController.passedName = buttonName
             DestViewController.userName = userName
        }
        else{
            let DestViewController : TrialGameScreen = segue.destination as! TrialGameScreen
            //doSomething(sender as! UIButton)
           // DestViewController.passedName = buttonName
            DestViewController.userName = userName
        }
        //performSegueWithIdentifier("threeToGame", sender: self)
        
    }
}
/*
import UIKit
import AVFoundation
class FundraiserScreen: UITableViewController {
    
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //////Background music /////////////////
        
        //MusicHelper.sharedHelper.playBackgroundMusic()
        
        
        /////////////////////////////////////////
        
        let date = Date()
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([.day , .month , .year], from: date)
        print(userName)
        let year =  components.year!
        let month = components.month!
        let day = components.day!
       // contestLabel.text = "Celebrities Squared\n" + String(describing: month) + "/" + String(describing: day) + "/" + String(describing: year)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    @IBAction func nordstromButton(sender: AnyObject) {
    //        performSegueWithIdentifier("timeOut", sender: self)
    //    }
    
//    @IBAction func doSomething(_ sender: UIButton) {
//        let propertyToCheck = sender.tag
//        switch propertyToCheck {
//        case 1:
//            buttonName = "Nordstroms"
//        case 2:
//            buttonName = "Michael Kors"
//        case 3:
//            buttonName = "Madonna"
//        case 4:
//            buttonName = "Yankees"
//        case 5:
//            buttonName = "Ruths Chris"
//        case 6:
//            buttonName = "Amazon Fire Tablet"
//        case 7:
//            buttonName = "Channing"
//        case 8:
//            buttonName = "KimKardashian"
//        case 9:
//            buttonName = "Bon Jovi"
//        case 10:
//            buttonName = "Blake Shelton"
//        case 11:
//            buttonName = "Gucci Hand Bag"
//        case 12:
//            buttonName = "Macy\'s Gift Card"
//        case 13:
//            buttonName = "Range Rover Sport"
//        case 14:
//            buttonName = "Samsung TV 4639.00"
//        case 15:
//            buttonName = "Meet a Celeb"
//        case 16:
//            buttonName = "Bellagio "
//        case 17:
//            buttonName = "Rhianna"
//        case 18:
//            buttonName = "IKEA"
//        case 19:
//            buttonName = "Starbucks"
//        case 20:
//            buttonName = "lexus"
//        case 21:
//            buttonName = "AMC"
//        case 22:
//            buttonName = "Louis Vuitton"
//        default: break
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // MusicHelper.sharedHelper.stopBackgroundMusic()
        if segue.identifier == "backMain" {
            var DestViewController : SecondScreen = segue.destination as! SecondScreen
            // doSomething(sender as! UIButton)
            // DestViewController.passedName = buttonName
            // DestViewController.userName = userName
        }
        else{
            let DestViewController : TrialGameScreen = segue.destination as! TrialGameScreen
                        DestViewController.userName = userName
        }
        //performSegueWithIdentifier("threeToGame", sender: self)
        
    }
    
}
*/
