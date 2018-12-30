//
//  HomeViewController.swift
//  QRReaderDemo
//
//  Created by Rohini Kundu on 8/22/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBAction func logoutClick(_ sender: Any) {
        //self.performSegue(withIdentifier: "logoutsegue", sender: sender)
        //self.navigationItem.leftBarButtonItem=nil;
        //navigationItem.hidesBackButton = true
        exit(0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
