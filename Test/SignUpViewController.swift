//
//  SignUpViewController.swift
//  Test
//
//  Created by Wayman, Zacheriah on 11/6/19.
//  Copyright © 2019 Wayman, Zacheriah. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var pword: UITextField!
    let ref = Database.database().reference()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submit(_ sender: Any) {
        Auth.auth().createUser(withEmail: email.text!, password: pword.text!) { (authResult, error) in //sign up code
            if error == nil {
                print("Sign up successful.")
                let user = Auth.auth().currentUser
                self.ref.child("users").child((user?.uid)!).setValue(["email": self.email.text, "name": self.name.text], withCompletionBlock: {
                    (error, dbRef) in
                    
                })
                
                self.performSegue(withIdentifier: "SignUpToMap", sender: self)
            }else{
                let alert = UIAlertController(title: "Sign up error.", message: error.debugDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
                print("Sign up error \(error.debugDescription)")
            }
        }
    }

    @IBAction func myUnwindFunction(unwindSegue: UIStoryboardSegue){
        
}
}
