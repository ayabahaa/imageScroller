//
//  HomeViewController.swift
//  Techno
//
//  Created by apple on 2/16/1441 AH.
//  Copyright © 1441 AH Softagi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        
        self.navigationController?.navigationBar.barTintColor  =  UIColor(red: 0.20784, green: 0.72941, blue: 0.6823, alpha: 3.0);
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func menuBar(_ sender: UIBarButtonItem) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "CategoriesViewController") as! CategoriesViewController
        self.navigationController?.pushViewController(view, animated: true)

    }
    
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
