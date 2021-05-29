//
//  ViewController.swift
//  Scientific construction
//
//  Created by Abdelrahman Saad on 4/7/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

import UIKit

class WelcomeScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       updateUI()
        
    }
    @objc func updateUI(){
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .black
    }
    @IBAction func LoginBtn(_ sender: UIButton) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "LoginScreen") as! LoginScreen
            self.navigationController?.pushViewController(view, animated: true)
    }
    

}

