//
//  ProjectsCell.swift
//  Techno
//
//  Created by Abdelrahman Saad on 10/20/19.
//  Copyright © 2019 Softagi. All rights reserved.
//

import UIKit

class ProjectsCell: UITableViewCell {
    @IBOutlet weak var ShortNameField: UILabel!
    
    @IBOutlet weak var DetailsNameField: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
