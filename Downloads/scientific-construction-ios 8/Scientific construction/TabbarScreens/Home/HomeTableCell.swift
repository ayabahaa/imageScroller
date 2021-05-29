//
//  HomeTableCell.swift
//  Scientific construction
//
//  Created by Abdelrahman Saad on 4/11/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

import UIKit

class HomeTableCell: UITableViewCell {

    @IBOutlet weak var courseCount: UILabel!
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var teacherImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
