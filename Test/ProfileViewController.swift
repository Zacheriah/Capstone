//
//  ProfileViewController.swift
//  Test
//
//  Created by Ashford, Aaron on 12/3/19.
//  Copyright © 2019 Wayman, Zacheriah. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class ProfileViewController: UIViewController {

    //@IBOutlet weak var pfpImage: UIImageView!
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var joinDate: UILabel!
    @IBOutlet weak var foundDinos: UILabel!
    
    var parsedDinos = [Dinosaur]()
    var selectedDinos = Dinosaur()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "inventoryTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "myCell")
        
        let rootRef = Database.database().reference()
        rootRef.child("bU96YIaLvaPY7MV0xKSBkTukrF72").child("dinos").observe(.value, with: { (snapshot) in
            if snapshot.value != nil {
                if snapshot.hasChildren() == true {
                    for child in snapshot.children
                    {
                        let c = Dinosaur()
                        
                        let childSnapshot = child as! DataSnapshot
                        
                        if(childSnapshot.hasChild("name"))
                        {
                            c.name = (childSnapshot.childSnapshot(forPath: "name").value as! String)
                        }
                        
                        if(childSnapshot.hasChild("diet"))
                        {
                            c.name = (childSnapshot.childSnapshot(forPath: "diet").value as! String)
                        }
                        
                        if(childSnapshot.hasChild("Period"))
                        {
                            c.name = (childSnapshot.childSnapshot(forPath: "Period").value as! String)
                        }
                        
                        self.parsedDinos.append(c)
                        self.tableView.reloadData()
                    }
                }
            } else {
                print("No existing Dinosaurs")
            }
        })

        // Do any additional setup after loading the view.
        print(self.parsedDinos.count)
        self.navBar.title = Auth.auth().currentUser?.uid
        //self.pfpImage.image = nothing working idgi
        self.joinDate.text = ("Join Date: " + ((Auth.auth().currentUser?.metadata.creationDate?.description)!))
        self.foundDinos.text = ("Dinosaurs Found: " + "1        "
        )
    }

    @IBAction func mapButton(_ sender: Any) {
        AppDelegate.showMap()
    }
}

extension ProfileViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! inventoryTableViewCell
        
        cell.dinoName.text = "T-rex"
        cell.dinoDiet.text = "Carnivore"
        cell.dinoEra.text = "Cretaceous"
        
        return cell
    }
}
