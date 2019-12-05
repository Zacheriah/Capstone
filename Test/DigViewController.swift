//
//  DigViewController.swift
//  Test
//
//  Created by Wayman, Zacheriah on 12/5/19.
//  Copyright © 2019 Wayman, Zacheriah. All rights reserved.
//

import UIKit

class DigViewController: UIViewController {

    @IBOutlet weak var topLayer: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.bringSubviewToFront(topLayer)
        topLayer.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(getter: topLayer))
        topLayer.addGestureRecognizer(tapGesture)
        
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

}
