//
//  ProfileViewController.swift
//  Test
//
//  Created by Ashford, Aaron on 12/3/19.
//  Copyright © 2019 Wayman, Zacheriah. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func mapButton(_ sender: Any) {
        AppDelegate.showMap()
    }
}
