//
//  FirebaseManager.swift
//  QRReaderDemo
//
//  Created by Rohini Kundu on 8/15/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class FirebaseManager: NSObject {
    static let databaseRef = Database.database().reference()
    static var currentUserId:String = ""
    static var currentUser:User? = nil
    
    static func Login(email:String, password:String, completion: @escaping (_ success:Bool) -> Void){
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
                exit(0)
            } else {
                currentUser = user
                currentUserId = (user?.uid)!
                    completion(true) }
            })
    }

}
