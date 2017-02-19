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
    var goalArray = [String]()
    var email = ""
    
    var objects: NSMutableArray!
    
    //Search Bar Declarations
    let searchController = UISearchController(searchResultsController: nil)
    
    // don't forget to hook this up from the storyboard
//    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         self.downloadJsonWithURL()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                            if let name = contestDict.value(forKey: "prize"){
                                self.prizeArray.append(name as! String)
                            }
                            
                            if let name = contestDict.value(forKey: "imageURL"){
                                self.imgURLArray.append(name as! String)
                            }
                            
                            if let name = contestDict.value(forKey: "goal"){
                                self.goalArray.append(name as! String)
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
    
    
    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return nameArray.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.nameLabel.text = nameArray[indexPath.row]
        cell.prizeLabel.text = "Prize: " + prizeArray[indexPath.row]
        cell.goalLabel.text = "Goal: $" + goalArray[indexPath.row]
        
        let imgURL = NSURL(string: imgURLArray[indexPath.row])
        
        if imgURL != nil{
            let data = NSData(contentsOf: (imgURL as? URL)!)
            cell.imageView!.image = UIImage(data: data as! Data)
        }
        
        cell.viewButton.tag = indexPath.row
        cell.viewButton.addTarget(self, action: "viewAction:", for: .touchUpInside)
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "contestscreenSegue", sender: self)
    }
    
    @IBAction func viewAction(sender: UIButton){
        //let contestName =
    }
    
    
 
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        //MusicHelper.sharedHelper.stopBackgroundMusic()
//        if segue.identifier == "backFromFund" {
//            var DestViewController : SecondScreen = segue.destination as! SecondScreen
//            // doSomething(sender as! UIButton)
//            // DestViewController.passedName = buttonName
//             DestViewController.email = email
//        }
//        else{
//            let DestViewController : TrialGameScreen = segue.destination as! TrialGameScreen
//            //doSomething(sender as! UIButton)
//           // DestViewController.passedName = buttonName
//            DestViewController.email = email
//            DestViewController.cellTapped = cellTapped
//        }
//        //performSegueWithIdentifier("threeToGame", sender: self)
//        
//    }
}

