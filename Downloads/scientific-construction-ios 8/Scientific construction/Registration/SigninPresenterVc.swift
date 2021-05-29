//
//  SigninPresenterVc.swift
//  Scientific construction
//
//  Created by Abdelrahman Saad on 4/9/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

import UIKit

class SigninPresenterVc: UIViewController {
    @IBOutlet weak var WelcomeLabel: UILabel!
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        WelcomeLabel.text = " مرحبا " + name
        // Do any additional setup after loading the view.
    }
    @IBAction func OkBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
