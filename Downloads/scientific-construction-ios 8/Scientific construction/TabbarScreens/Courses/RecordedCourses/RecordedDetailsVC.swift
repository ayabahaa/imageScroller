//
//  RecordedCoursesDetailsVC.swift
//  Scientific construction
//
//  Created by Abdelrahman Saad on 4/18/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

import UIKit
import Parchment
class RecordedDetailsVC: UIViewController {
    @IBOutlet weak var ParchmentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
                   let firstViewController = storyboard.instantiateViewController(withIdentifier: "ChaptersVC")
                   let secondViewController = storyboard.instantiateViewController(withIdentifier: "MarksVC")
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
}
