//
//  changePasswordVC.swift
//  Scientific construction
//
//  Created by apple on 4/14/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

import UIKit

class changePasswordVC: UIViewController {

    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var currentPassword: UITextField!
    var data: ChangePasswordModel?
//    var changeVC:navigateVC?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancleButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    @IBAction func changeButton(_ sender: UIButton) {
         postUserInfo()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let view = storyboard.instantiateViewController(withIdentifier: "WelcomeScreen") as! WelcomeScreen
//        self.changeVC?.navigationController?.pushViewController(view, animated: true)
        
    }
    
   func postUserInfo(){
    guard let oldPass = currentPassword.text, let newPass = newPassword.text , let confirmPass = confirmPassword.text,  oldPass.isEmpty == false, newPass.isEmpty == false , confirmPass.isEmpty == false
        else {
        return  Utility.showAlertMessage(withTitle: "البناء العلمي", message: "تأكد من اكمال البيانات", delegate: nil, parentViewController: self)
    }
      self.view.makeToastActivity(.center)
      NetworkClient.performRequest(ChangePasswordModel.self, router: .changepassword(token: userID!, old_password: oldPass, password: newPass, password_confirmation: confirmPass), success: { [weak self] (models) in
    
        self?.data = models
                print("models\( models)")
        
        
        if(models.status == true){
            
            var mesg = models.message ?? ""
            self?.view.hideToastActivity()
            exit(0)
          
            Utility.showAlertMessage(withTitle: "البناء العلمي", message: mesg  , delegate: nil, parentViewController: self!)
    
             
                 print("seccuse ")
             }
           else if(models.status == false){

                var masg2 = models.messages
                var mesg3 = models.message ?? ""
              if(masg2 != nil ) {
                    let old = models.messages?.currentPassword?[0] ?? ""
                    let new = models.messages?.newPassword?[0] ?? ""
                    let confirm = models.messages?.passwordConfirmation?[0] ?? ""
                    self?.view.hideToastActivity()
              
                    Utility.showAlertMessage(withTitle: "البناء العلمي", message: "\(old)" + "   " + "\(new)" + "   " + "\(confirm)", delegate: nil, parentViewController: self!)

                }else{
                        self?.view.hideToastActivity()
                        Utility.showAlertMessage(withTitle: "البناء العلمي", message: mesg3  , delegate: nil, parentViewController: self!)
                    

                }
                  
                 print("errorrr")
        }
    
             }) { [weak self] (error) in
                 self?.view.hideToastActivity()
                
                 guard let error = error as? BaseError else { return }
                 if case .other(let error) = error {
                               //self?.displayError(error )
                 } else {
                               //self?.displayError(error.MyDescription)
                 }
    
               }
         }


}
