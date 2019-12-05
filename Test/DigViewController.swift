//
//  DigViewController.swift
//  Test
//
//  Created by Wayman, Zacheriah on 12/5/19.
//  Copyright © 2019 Wayman, Zacheriah. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth


class DigViewController: UIViewController {
    var userid = Auth.auth().currentUser?.uid
    var dbRef = Database.database().reference()
    @IBOutlet weak var topLayer: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.bringSubviewToFront(topLayer)
        topLayer.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        topLayer.addGestureRecognizer(tapGesture)

        // Do any additional setup after loading the view.
    }
    @objc func handleTap(sender: UITapGestureRecognizer){
        if sender.state == .ended{
            self.topLayer.image = nil
            dbRef.child(userid!).child("dinos").childByAutoId().updateChildValues(["name" : "T-rex", "diet": "Carnivore", "Period" : "Cretaceous" ]){ (error, dbRef) in
                if error == nil{
                    self.dismiss(animated: true, completion: nil)
                }else{
                    print(error!.localizedDescription)
                }
        }
    }
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
