//
//  Courses_programsVC.swift
//  Scientific construction
//
//  Created by Abdelrahman Saad on 4/16/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

import UIKit

class Courses_programsVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
  @objc func updateUI(){
        tableView.registerNib(cell: Courses_ProgramsCell.self)
    }
    

}
extension Courses_programsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as Courses_ProgramsCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
