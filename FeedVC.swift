//
//  FeedVC.swift
//  SocialApp
//
//  Created by Auriel on 6/17/17.
//  Copyright © 2017 Sphexis. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase
import FirebaseAuth

class FeedVC: UIViewController {
    
    //IBOutlets
    
    @IBAction func signOutTapped(_ sender: AnyObject) {
        if((self.presentingViewController) != nil) {
            self.dismiss(animated: false, completion: nil)
            }
        //let keychainResult = KeychainWrapper.removeObjectForKey(KEY_UID)
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        try! Auth.auth().signOut()
        print("MESSAGE: ID removed from keychain \(keychainResult)")
        
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
