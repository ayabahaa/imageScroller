//
//  CoursesVC.swift
//  Scientific construction
//
//  Created by Abdelrahman Saad on 4/16/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

import UIKit
import Parchment
class CoursesVC: UIViewController {
    @IBOutlet weak var ParchmentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    @objc func updateUI(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                      let firstViewController = storyboard.instantiateViewController(withIdentifier: "AvailableCoursesVC") 
                      let secondViewController = storyboard.instantiateViewController(withIdentifier: "RecordedCourses")
                      let thirdViewController = storyboard.instantiateViewController(withIdentifier: "FinishedCourses")
                      let fourthViewController = storyboard.instantiateViewController(withIdentifier: "CompletionReports")
                      navigationItem.largeTitleDisplayMode = .never
                      let pagingViewController = PagingViewController(viewControllers: [
                        fourthViewController,
                        thirdViewController,
                        secondViewController,
                        firstViewController
                        
                          ])
                      pagingViewController.select(index: 3)
                      pagingViewController.indicatorColor = UIColor(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1)
                      pagingViewController.selectedTextColor = UIColor(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1)
                      addChild(pagingViewController)
                      ParchmentView.addSubview(pagingViewController.view)
                      ParchmentView.constrainToEdges(pagingViewController.view)
                      pagingViewController.didMove(toParent: self)
    }
}
