//
//  ListViewController.swift
//  QRReaderDemo
//
//  Created by Rohini Kundu on 8/17/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var postData = [String]()
    
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    var databaseHandle2:DatabaseHandle?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
        
        ref = Database.database().reference()
        
        databaseHandle = ref?.observe(.childAdded, with: { (snapshot) in
            let post = snapshot.value as? String
            
            if let actualPost = post {
                self.postData.append(actualPost)
                self.tableView.reloadData()
            }
            
        })
        
        databaseHandle2 = ref?.observe(.childRemoved, with: { (snapshot) in
            let post = snapshot.value as? String
            
            if let actualPost = post, let index = self.postData.index(of: actualPost) {
                self.postData.remove(at: index)
                self.tableView.reloadData()
            }
            
        })
        
        tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let name = self.postData.remove(at: indexPath.row)
        ref = Database.database().reference()
        ref?.child(name).removeValue()
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = postData[indexPath.row]
        
        return cell!
    }

}
