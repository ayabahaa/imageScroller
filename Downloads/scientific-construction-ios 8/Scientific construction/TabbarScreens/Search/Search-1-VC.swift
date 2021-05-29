//
//  Search-1-VC.swift
//  Scientific construction
//
//  Created by Abdelrahman Saad on 4/14/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

import UIKit
import Parchment
class Search_1_VC: UIViewController {
    @IBOutlet var ParchmentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       updateUI()
    }
    @objc func updateUI(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(addTapped))
               
               navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "MenuIcon"), landscapeImagePhone: UIImage(named: "MenuIcon"), style: .plain, target: self, action: #selector(addTapped))
               navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 0.5406702161, green: 0.5406834483, blue: 0.5406762958, alpha: 1)
               navigationItem.title = "الحديث النبوي"
               let textAttributes = [NSAttributedString.Key.foregroundColor:#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
               navigationController?.navigationBar.titleTextAttributes = textAttributes
               // Do any additional setup after loading the view.
               let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let firstViewController = storyboard.instantiateViewController(withIdentifier: "Courses_programsVC")
               let secondViewController = storyboard.instantiateViewController(withIdentifier: "TeachingStaffVC")
               navigationItem.largeTitleDisplayMode = .never
               let pagingViewController = PagingViewController(viewControllers: [
                   firstViewController,
                   secondViewController
                   ])
               pagingViewController.indicatorColor = UIColor(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1)
               pagingViewController.selectedTextColor = UIColor(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1)
               addChild(pagingViewController)
               ParchmentView.addSubview(pagingViewController.view)
               ParchmentView.constrainToEdges(pagingViewController.view)
               pagingViewController.didMove(toParent: self)
    }
    @objc func addTapped(sender: UIBarButtonItem) {
        // Perform your custom actions
        // ...
        // Go back to the previous ViewController
        _ = navigationController?.popViewController(animated: true)
    }
    

}
