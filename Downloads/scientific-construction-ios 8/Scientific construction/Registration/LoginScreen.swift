//
//  LoginScreen.swift
//  Scientific construction
//
//  Created by Abdelrahman Saad on 4/7/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

import UIKit
import Toast_Swift
import Alamofire

class LoginScreen: UIViewController {
    @IBOutlet weak var MyView: UIView!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    var data : LoginModel?
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTF.text = "ahmed@test.com"
        passwordTF.text = "1234567"
       UpdateUI()
    }
    @objc func UpdateUI() {
         MyView.roundedButton()
               self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
               self.navigationController?.navigationBar.shadowImage = UIImage()
               self.navigationController?.navigationBar.isTranslucent = true
                    navigationController?.setNavigationBarHidden(true, animated: true)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
            navigationController?.setNavigationBarHidden(true, animated: true)

    }
    @objc func dismissKeyboard() {
           view.endEditing(true)
       }
    
    enum myerror{
        case message
        case messages
    }
    @IBAction func LoginButton(_ sender: UIButton) {
        guard let emailText = emailTF.text, let passwordText = passwordTF.text, emailText.isEmpty == false, passwordText.isEmpty == false else {
                 return  Utility.showAlertMessage(withTitle: "البناء العلمي", message: "تأكد من اكمال البيانات", delegate: nil, parentViewController: self)
             }
             
          self.view.makeToastActivity(.center)
        NetworkClient.performRequest(LoginModel.self, router: .login(email: emailText, password: passwordText), success: { [weak self] (models) in
          
            self?.data = models
            print("models\(models.data?.apiToken)")
            let model = models.data?.apiToken
              self?.defaults.set(model, forKey: "key")
              if(models.status == true){
              
                  let view = self?.storyboard?.instantiateViewController(withIdentifier: "TabbarVC") as! TabbarVC
                
                  self?.navigationController?.pushViewController(view, animated: true)

              }
              else if (models.status == false ){
             
                var mesg = models.message ?? ""
                var masg2 = models.messages
                if(masg2 != nil ) {
                    let mesgEmail = models.messages?.email?[0] ?? ""
                    let mesgPass = models.messages?.password?[0] ?? ""
                     self?.view.hideToastActivity()
                    Utility.showAlertMessage(withTitle: "البناء العلمي", message: "\(mesgEmail)" + "  " + "\(mesgPass)", delegate: nil, parentViewController: self!)
                }else{
                    self?.view.hideToastActivity()
                      Utility.showAlertMessage(withTitle: "البناء العلمي", message: mesg   , delegate: nil, parentViewController: self!)
                }
   
                  print("errorrr")
                 // AuthManager.loggedIn = false
                   
              }
              
             }) { [weak self] (error) in
              self?.view.hideToastActivity()
              guard let error = error as? BaseError else { return }
              if case .other(let error) = error {
                  self?.displayError(error )
              } else {
                  self?.displayError(error.MyDescription)
              }
                 
             }
    }
    @IBAction func RegisterBtn(_ sender: UIButton) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func displayError(_ text: String){
       
     }
}
extension UIView{
    func roundedButton(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
        byRoundingCorners: [.topLeft , .topRight],
        cornerRadii: CGSize(width: 10, height: 10))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}
