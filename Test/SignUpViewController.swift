//
//  SignUpViewController.swift
//  InClass12
//
//  Created by Ashford, Aaron on 4/17/19.
//  Copyright © 2019 Ashford, Aaron. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var cpassTF: UITextField!
    
    let alert01 = UIAlertController(title: "Missing Field!", message: "A text field is empty!", preferredStyle: .alert)
    let alert02 = UIAlertController(title: "Password Mismatch!", message: "Your passwords do not match!", preferredStyle: .alert)
    let alert03 = UIAlertController(title: "Sign Up Failure!", message: "", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.alert01.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.alert02.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.alert03.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
    }
    
    @IBAction func submit(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            self.alert03.message = "A User is Already Logged In!"
            print("1")
        } else if (emailTF.text == nil || passTF.text == nil) {
            self.present(self.alert01, animated: true)
            print("2")
        } else if (passTF.text != cpassTF.text) {
            self.present(self.alert02, animated: true)
            print("3")
        } else {
            Auth.auth().createUser(withEmail: emailTF.text!, password: passTF.text!) { (authResult, error) in
                if error == nil {
                    AppDelegate.showLogin()
                } else {
                    self.alert03.message = error.debugDescription
                    self.present(self.alert03, animated: true)
                }
            }
        }
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        AppDelegate.showTitle()
    }
}
