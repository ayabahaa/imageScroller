//
//  SummaryCell.swift
//  Scientific construction
//
//  Created by Abdelrahman Saad on 4/20/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

import UIKit

class SummaryCell: UITableViewCell {
    @IBOutlet weak var MoreButton: UIButton!
    var  actionButton : (()-> ())?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func MoreButtonTapped(_ sender: UIButton) {
          actionButton?()
    }
    
}
