//
//  TitleViewController.swift
//  Test
//
//  Created by Wayman, Zacheriah on 12/3/19.
//  Copyright © 2019 Wayman, Zacheriah. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginVC(_ sender: UIButton) {
        AppDelegate.showLogin()
    }
    
    @IBAction func SignUpButton(_ sender: UIButton) {
        AppDelegate.showSignUp()

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
