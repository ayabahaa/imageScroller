//
//  ProfileVC.swift
//  Scientific construction
//
//  Created by Abdelrahman Saad on 4/12/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
   
    
    @IBOutlet weak var passwordButton: UIButton!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var userTF: UITextField!
    @IBOutlet weak var userNameTF: UILabel!
    
    var userData : UserInfoModel?
    var gender :String = ""
    var countryId : Int = 0
    var cityId : Int = 0
     var check = false
    override func viewDidLoad() {
        super.viewDidLoad()
       
        getUserInfo()
       
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func editButton(_ sender: UIButton) {
        if check {
            sender.setImage(UIImage(named: "edit"), for: .normal)
            self.userTF.isUserInteractionEnabled = false
            self.emailTF.isUserInteractionEnabled = false
            self.phoneTF.isUserInteractionEnabled = false
            self.countryTF.isUserInteractionEnabled = false
            self.cityTF.isUserInteractionEnabled = false
            check = false
            postUserInfo()
            print("not press")
           
        }
        else {
            sender.setImage(UIImage(named: "RightSign"), for: .normal)
              self.userTF.isUserInteractionEnabled = true
              self.emailTF.isUserInteractionEnabled = true
              self.phoneTF.isUserInteractionEnabled = true
              self.countryTF.isUserInteractionEnabled = true
              self.cityTF.isUserInteractionEnabled = true
              print("press")
            check = true
               }
        
    }
  
    
    @IBAction func passwordNav(_ sender: UIButton) {
//        self.view.addSubview(popView)
//        popView.center = self.view.center
        let view = self.storyboard?.instantiateViewController(withIdentifier: "changePasswordVC") as! changePasswordVC
        view.modalPresentationStyle = .overFullScreen
        self.navigationController?.present(view, animated: true )
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
       self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
             navigationController?.setNavigationBarHidden(true, animated: true)
    }
    func getUserInfo(){
        self.view.makeToastActivity(.center)
        NetworkClient.performRequest(UserInfoModel.self, router: .userInformation(token: userID!), success: { [weak self] (models) in
         
            self?.userData = models
            print("models\( models)")
            self?.gender = (models.data?.gender)!
            self?.cityId = (models.data?.cityID?[0].id)!
            self?.countryId = (models.data?.countryID?[0].id)!
           
         if(models.status == true){
             
            self?.view.hideToastActivity()
            self?.userNameTF.text = self?.userData?.data?.name
            self?.userTF.text = self?.userData?.data?.name
            self?.userTF.isUserInteractionEnabled = false
            self?.emailTF.text = self?.userData?.data?.email
            self?.emailTF.isUserInteractionEnabled = false
            self?.phoneTF.text = self?.userData?.data?.mobile
            self?.phoneTF.isUserInteractionEnabled = false
            self?.countryTF.text = self?.userData?.data?.countryID?[0].countryName
            self?.countryTF.isUserInteractionEnabled = false
            self?.cityTF.text = self?.userData?.data?.cityID?[0].cityName
            self?.cityTF.isUserInteractionEnabled = false
             print("seccuse ")
         }
         else if (models.status == false ){
    //                     var mesg = models.message ?? ""
    //                     var masg2 = models.messages
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
        func postUserInfo(){
            guard let names = userTF.text, let email = emailTF.text , let mobile = phoneTF.text else {
                return
            }
            self.view.makeToastActivity(.center)
            NetworkClient.performRequest(UserInfoModel.self, router: .updateAccount(name: names, email: email , mobile: mobile, countryId: String(countryId), cityId: String(cityId), agreement: "yes", gender: gender, token: userID!), success: { [weak self] (models) in
    
                self?.userData = models
                print("models\( models)")
    
             if(models.status == true){
                
                self?.view.hideToastActivity()
                 print("seccuse ")
             }
             else if (models.status == false ){
        //                     var mesg = models.message ?? ""
        //                     var masg2 = models.messages
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
