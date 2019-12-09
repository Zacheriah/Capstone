//
//  inventoryTableViewCell.swift
//  Test
//
//  Created by Ashford, Aaron on 12/9/19.
//  Copyright © 2019 Wayman, Zacheriah. All rights reserved.
//

import UIKit

class inventoryTableViewCell: UITableViewCell {

    @IBOutlet weak var dinoName: UILabel!
    @IBOutlet weak var dinoDiet: UILabel!
    @IBOutlet weak var dinoEra: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
