//
//  SignInVC.swift
//  SocialApp
//
//  Created by Auriel on 6/12/17.
//  Copyright © 2017 Sphexis. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import FirebaseAuth
import SwiftKeychainWrapper

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailField: FancyField!
    @IBOutlet weak var passwordField: FancyField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID) {
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
    }
    
    //IBOutlets
    @IBAction func facebookBtnTapped(_sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) {(result, error) in
            if error != nil {
                print("MESSAGE:Unable to authenticate with Facebook - \(String(describing: error))")
            } else if result?.isCancelled == true {
                print("MESSAGE: User cancelled Facebook authentication")
            } else {
                print("MESSAGE: Successfully authenticated Facebook")
              let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
    }
        
}
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("MESSAGE: Unable to authenticate with Firebase - \(String(describing: error))")
            } else {
                print("MESSAGE: Successfully authenticated with firebase")
                if let user = user {
                    let userData = ["provider": credential.provider]
                    self.completeSignIn(id: user.uid, userData: userData)
                }
            }
    })
    
}
        
//    @IBAction func signInTapped(_sender: AnyObject) {
//        if let email = emailField.text, let password = passwordField.text {
//            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
//                if error == nil{
//                    print("MESSAGE: Email user authenticate with Firebase using email")
//                if let user = user {
//                    let userData = ["provider": user.providerID]
//                    self.completeSignIn(id: user.uid, userData: userData)
//                    }
//                } else {
//            Auth.auth().signIn.createUser(withEmail: email, password: password, completion: { (user, error) in
//                if error != nil {
//                    print("MESSAGE: Unable to authenticate with Firebase using email")
//                } else {
//                   print("MESSAGE: Successfully authenticated with firebase")
//                    if let user = user {
//                        let userData = ["provider": user.providerID]
//                        self.completeSignIn(id: user.id, userData: userData)
//                    }
//                }
//                
//            })
//        }
//    })
//  }
//        
//}
    
    func completeSignIn(id: String, userData: Dictionary<String, String>) {
        //DataSer
    }
    
    
    
    
    
    


}

