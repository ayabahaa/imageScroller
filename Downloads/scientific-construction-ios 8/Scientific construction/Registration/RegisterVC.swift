//
//  RegisterVC.swift
//  Scientific construction
//
//  Created by Abdelrahman Saad on 4/8/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

import UIKit
import DropDown
class RegisterVC: UIViewController {
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var genderTF: UITextField!
    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var CityStack: UIStackView!
    @IBOutlet weak var fullNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var mobileTF: UITextField!
    
     var data : RegisterModel?
     var data1 : CountryModel?
     var data2 : CityModel?
    var stringArray:[String] = []
    var stringArray2:[String] = []
    var countryId : Int = 0
    var cityId : Int = 0
    var yourGender: String = ""
     let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
             navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.leftBarButtonItem?.isEnabled = true
        // Do any additional setup after loading the view.
    }
    @IBAction func ExitBtn(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func signInBtn(_ sender: UIBarButtonItem) {
   
        guard let name = fullNameTF.text, let passwordText = passwordTF.text, let emailText = emailTF.text,let mobileText = mobileTF.text ,let country = countryTF.text, let city = cityTF.text, let gender = genderTF.text, emailText.isEmpty == false, passwordText.isEmpty == false , mobileText.isEmpty == false, name.isEmpty == false, country.isEmpty == false, city.isEmpty == false, gender.isEmpty == false else {
            return  Utility.showAlertMessage(withTitle: "البناء العلمي", message: "تأكد من اكمال البيانات", delegate: nil, parentViewController: self)
                  }
                  
               self.view.makeToastActivity(.center)
        NetworkClient.performRequest(RegisterModel.self, router: .Register(name: name, email: emailText, mobile: mobileText, password: passwordText, password_confirmation: passwordText, countryId: String(countryId), cityId: String(cityId), agreement: "yes", gender: "male"), success: { [weak self] (models) in
               
                 self?.data = models
                 print("models\(models.data?.apiToken)")
                 let model = models.data?.apiToken
                   self?.defaults.set(model, forKey: "key")
                   if(models.status == true){
                       let view = self?.storyboard?.instantiateViewController(withIdentifier: "TabbarVC") as! TabbarVC
                      // AuthManager.loggedIn = true
                    self?.navigationController?.navigationBar.shadowImage = UIImage()
                    self?.navigationController?.navigationBar.isTranslucent = true
                    self?.navigationController?.setNavigationBarHidden(true, animated: true)
                    self?.navigationController?.pushViewController(view, animated: true)
                    let view2 = self?.storyboard?.instantiateViewController(identifier: "SigninPresenterVc") as! SigninPresenterVc
                    view2.name = name
                    self?.navigationController?.present(view2 , animated: true)


                   }
                   else if (models.status == false ){
                  
                    //                     var mesg = models.message ?? ""
                    //                     var masg2 = models.messages
                    //                     if(masg2 != nil ) {
                    //                         let mesgEmail = models.messages?.email?[0] ?? ""
                    //                         let mesgPass = models.messages?.password?[0] ?? ""
                    //                          self?.view.hideToastActivity()
                    //                         Utility.showAlertMessage(withTitle: "البناء العلمي", message: "\(mesgEmail)" + "  " + "\(mesgPass)", delegate: nil, parentViewController: self!)
                    //                     }else{
                    //                         self?.view.hideToastActivity()
                    //                           Utility.showAlertMessage(withTitle: "البناء العلمي", message: mesg   , delegate: nil, parentViewController: self!)
                    //                     }
        
                       print("errorrr")
                     
                        
                   }
                   
                  }) { [weak self] (error) in
                   self?.view.hideToastActivity()
                   guard let error = error as? BaseError else { return }
                   if case .other(let error) = error {
//                       self?.displayError(error )
                   } else {
//                       self?.displayError(error.MyDescription)
                   }
                      
                  }
        
    }
    @IBAction func cityDropDownBtn(_ sender: UIButton) {
            let dropDown = DropDown()
                dropDown.backgroundColor = .white
                dropDown.textColor = .black
                dropDown.anchorView = cityView
                dropDown.dataSource = stringArray2
                dropDown.selectionAction = { (index: Int , item: String) in
            switch index {
            default:
                return self.cityTF.text = item
            }
        }
        dropDown.width = cityView.frame.width
        dropDown.show()
    }
    @IBAction func genderDropDownBtn(_ sender: UIButton) {
                    let dropDown = DropDown()
                    dropDown.backgroundColor = .white
                    dropDown.textColor = .black
                    dropDown.anchorView = genderView
                     dropDown.dataSource = ["رجل","امراة"]
             dropDown.selectionAction = { (index: Int , item: String) in
                 switch index {
                 default:
                    return self.genderTF.text = item
                 }
             }
             self.yourGender = genderTF.text!
             dropDown.width = genderView.frame.width
             dropDown.show()
        
    }
    
    @IBAction func countryDropDownBtn(_ sender: UIButton) {
        let dropDown = DropDown()
               dropDown.backgroundColor = .white
               dropDown.textColor = .black
               dropDown.anchorView = countryView
        dropDown.dataSource = stringArray
        dropDown.selectionAction = { (index: Int , item: String) in
            switch index {
            default:
                self.CityStack.isHidden = false
               return self.countryTF.text = item
               
            }
        }
       
        dropDown.width = countryView.frame.width
        dropDown.show()

    }
    func getData() {
        NetworkClient.performRequest(CountryModel.self, router: .allCountry, success: { [weak self] (models) in
                       
            self?.data1 = models
            for item in models.data! {
                self?.stringArray.append(item.countryName ?? "")
                print(self?.stringArray)
            }
            for id in models.data! {
                self?.countryId = id.id ?? 0
                self?.getData1(id: id.id! )
            }
           
        }) { [weak self] (error) in
            
            guard let error = error as? BaseError else { return }
                if case .other(let error) = error {
        //      self?.displayError(error )
            } else {
        //      self?.displayError(error.MyDescription)
            }
                              
            }
    }
    func getData1(id : Int) {
        NetworkClient.performRequest(CityModel.self, router: .citiesByCountry(countryId: id), success: { [weak self] (models) in
                       
            self?.data2 = models
            for item in models.data! {
                self?.stringArray2.append(item.cityName ?? "")
                print(self?.stringArray2)
            }
            for id in models.data! {
                self?.cityId = id.id ?? 0
            }
        }) { [weak self] (error) in
            
            guard let error = error as? BaseError else { return }
                if case .other(let error) = error {
        //      self?.displayError(error )
            } else {
        //      self?.displayError(error.MyDescription)
            }
                              
            }
    }

    
}
