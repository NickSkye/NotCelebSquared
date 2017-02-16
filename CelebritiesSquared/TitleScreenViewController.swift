//
//  TitleScreenViewController.swift
//  CelebritiesSquared
//
//  Created by Dori Mouawad on 2/15/17.
//  Copyright © 2017 Nick Hoyt. All rights reserved.
//

import UIKit

class TitleScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: "timeToMoveOn", userInfo: nil, repeats: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func timeToMoveOn(){
        self.performSegue(withIdentifier: "titleScreenSegue", sender: self)
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
