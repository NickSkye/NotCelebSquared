//
//  ContestScreen.swift
//  CelebritiesSquared
//
//  Created by Dori Mouawad on 2/18/17.
//  Copyright © 2017 Nick Hoyt. All rights reserved.
//

import UIKit

class ContestScreen: UIViewController {

    var email = ""
    var contestName = ""
    var prizeURL = ""
    var desc = ""
    var goal = ""
    var current = ""
    var prize = ""
    var responseString = ""
    
    @IBOutlet var imageView: UIImageView!
    final let urlString = "http://dev.celebritiessquared.com/CSPhp/FullFundraiserInfo.php"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print (email)
        print(contestName)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func downloadJsonWithURL(){
//        let url = NSURL(string: urlString)
//        
//        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, response, error) ->
//            Void in
//            
//            
//            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
//                as? NSDictionary{
//                
//                if let contestArray = jsonObj!.value(forKey: "contest") as? NSArray{
//                    for contest in contestArray{
//                        if let contestDict = contest as? NSDictionary{
//                            if let name = contestDict.value(forKey: "prize"){
//                                self.prize.append( name as! String)
//                            }
//                            
//                            if let name = contestDict.value(forKey: "prizeURL"){
//                                self.prizeURL.append(name as! String)
//                            }
//                            
//                            if let name = contestDict.value(forKey: "goal"){
//                                self.goal.append(name as! String)
//                            }
//                            
//                            print(jsonObj)
//                        }
//                    }
//                }
//            }
//            
//        }).resume()
//    }
    
    func postToServerFunction(){
        //Contingency Handling. Error handling etc.

        var request = URLRequest(url: URL(string: "http://dev.celebritiessquared.com/CSPhp/FullFundraiserInfo.php")!)
        
        request.httpMethod = "POST"
        
        var postString: String!
        postString = "name=\(contestName)"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            self.responseString = String(data: data, encoding: .utf8)!
            print("responseString = \(self.responseString)")
            
        }
        task.resume()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
