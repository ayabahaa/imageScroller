//
//  CoursesTableCell.swift
//  Scientific construction
//
//  Created by Abdelrahman Saad on 4/16/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

import UIKit

class CoursesTableCell: UITableViewCell {
    var  actionButton : (()-> ())?
    
    @IBOutlet weak var courseButton: UIButton!
    @IBOutlet weak var theImage: UIImageView!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func courseButtonTapped(_ sender: UIButton) {
         actionButton?()
    }
   
}
