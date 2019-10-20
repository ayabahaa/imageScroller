//
//  loginViewController.swift
//  Techno
//
//  Created by apple on 2/16/1441 AH.
//  Copyright © 1441 AH Softagi. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var userNameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordText.layer.masksToBounds = false
        passwordText.layer.cornerRadius = 1.0;
        passwordText.layer.shadowRadius = 2.0
        passwordText.layer.shadowColor = UIColor.darkGray.cgColor
        passwordText.layer.shadowOffset = CGSize(width: 0, height: 0)
        passwordText.layer.shadowOpacity = 0.7
        passwordText.borderStyle = UITextField.BorderStyle.roundedRect
        passwordText.layer.borderWidth = 2.0
        passwordText.layer.borderColor = UIColor.clear.cgColor
        
        
        userNameText.layer.masksToBounds = false
        userNameText.layer.shadowRadius = 2.0
        userNameText.layer.shadowColor = UIColor.darkGray.cgColor
        userNameText.layer.shadowOffset = CGSize(width: 0, height: 0)
        userNameText.layer.shadowOpacity = 0.7
        userNameText.borderStyle = UITextField.BorderStyle.roundedRect
        userNameText.layer.borderWidth = 2.0
        userNameText.layer.borderColor = UIColor.clear.cgColor
        
        login.layer.masksToBounds = false
        login.layer.shadowRadius = 2.0
        login.layer.shadowColor = UIColor.darkGray.cgColor
        login.layer.shadowOffset = CGSize(width: 0, height: 0)
        login.layer.shadowOpacity = 1.0
//        login.borderStyle = UITextField.BorderStyle.roundedRect
        login.layer.borderWidth = 2.0
        login.layer.borderColor = UIColor.clear.cgColor
        
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
    @IBAction func loginButton(_ sender: UIButton) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "homeNav")
         self.present(view!, animated: true)
//        self.modalPresentationStyle = .overCurrentContext
//        present(view, animated: true)
    }
    
}
