//
//  LoginViewController.swift
//  Test
//
//  Created by Wayman, Zacheriah on 11/6/19.
//  Copyright © 2019 Wayman, Zacheriah. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailEntry: UITextField!
    @IBOutlet weak var passwordEntry: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do { // signs the user out
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    

    
    @IBAction func submit(_ sender: Any) {
        if Auth.auth().currentUser != nil { //checks if a user is already signed in
            print("Already logged in.")
            AppDelegate.showMap()
        }else{
            Auth.auth().signIn(withEmail: emailEntry.text!, password: passwordEntry.text!) { (authResult, error) in
                if error == nil {
                    print("Sign in successful. \(authResult!.user.uid)")
                    AppDelegate.showMap()
                }else{
                    let alert = UIAlertController(title: "Log in error.", message: error.debugDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true)
                    print("Error: \(error.debugDescription)")
                }
            }
        }
    }

    @IBAction func signup(_ sender: Any) {
        AppDelegate.showSignUp()
    }
}
