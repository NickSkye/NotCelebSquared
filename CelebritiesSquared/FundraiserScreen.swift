//
//  FundraiserScreen.swift
//  CelebritiesSquared
//
//  Created by Nick Hoyt on 2/2/17.
//  Copyright © 2017 Nick Hoyt. All rights reserved.
//
import UIKit
class FundraiserScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
     final let urlString = "http://dev.celebritiessquared.com/CSPhp/GetContests.php"
    // Data model: These strings will be the data for the table view cells
    var nameArray = [String]()
    var prizeArray = [String]()
    var imgURLArray = [String]()
    
    var cellTapped = 0
    var userName = "DICK"
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    // don't forget to hook this up from the storyboard
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 100.0 //change to change row height
       // self.tableView.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)

         self.downloadJsonWithURL()
        let label = UILabel(frame: CGRect(x: 0 , y: 0 , width: UIScreen.main.bounds.size.width, height: 50))
        label.center.x = self.view.center.x
        label.text = "Fundraisers"
        label.textColor = UIColor(red: 218/255, green: 165/255, blue: 32/255, alpha: 1)
        label.font = UIFont(name: "Copperplate-Bold", size: 26)
        label.textAlignment = .center
        tableView.addSubview(label)
        //tableView.center.x = self.view.center.x
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 65))
        self.tableView.tableHeaderView?.backgroundColor = UIColor(red: 175/255, green: 31/255, blue: 0/255, alpha: 1)
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 64, 0)
        
        ///////////////////////////////////////////////////////////////////////////////////
        ///////////////////BACK BUTTON////////////////////////////////////////////////////
      
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
       // button.backgroundColor = UIColor.blue
        button.setTitle("Back", for: .normal)
        //button.setTitleColor(<#T##color: UIColor?##UIColor?#>, for: <#T##UIControlState#>)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        tableView.addSubview(button)
        
        
    //////////////////////////////////BACK BUTTON END//////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////
    }
    func backButtonTapped(){
        self.performSegue(withIdentifier: "backFromFund", sender: self)
        print("Button pressed")
    }
    
    /////////////////////////////////DORI STUFF//////////////////////////////////////////
    
    func downloadJsonWithURL(){
        let url = NSURL(string: urlString)
        
        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, response, error) ->
            Void in
            
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                as? NSDictionary{
                
                if let contestArray = jsonObj!.value(forKey: "contest") as? NSArray{
                    for contest in contestArray{
                        if let contestDict = contest as? NSDictionary{
                            if let name = contestDict.value(forKey: "name"){
                                self.nameArray.append(name as! String)
                            }
                            //                            if let name = contestDict.value(forKey: "prize"){
                            //                                self.prizeArray.append(name as! String)
                            //                            }
                            if let name = contestDict.value(forKey: "imageURL"){
                                self.imgURLArray.append(name as! String)
                            }
                            
                            OperationQueue.main.addOperation ({
                                self.tableView.reloadData()
                            })
                        }
                    }
                }
            }
            
        }).resume()
    }

    func downloadJsonWithTask() {
        let url = NSURL(string: urlString)
        
        var downloadTask = URLRequest(url: (url as? URL)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20)
        
        downloadTask.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: downloadTask, completionHandler: {(data, response, error) -> Void in
            let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            print(jsonData)
        }).resume()
    }
    
    
    
    ////////////////////////////////END DORI STUFF///////////////////////////////////////
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
       
        // set the text from the data model
       // cell.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        cell.textLabel?.text = nameArray[indexPath.row]
        let imgURL = NSURL(string: imgURLArray[indexPath.row])
       
        if imgURL != nil{
            let data = NSData(contentsOf: (imgURL as? URL)!)
            cell.imageView?.image = UIImage(data: data as! Data)
            //cell.imageView?.image?.size =
        }
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        cellTapped = indexPath.row
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
            DestViewController.cellTapped = cellTapped
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
