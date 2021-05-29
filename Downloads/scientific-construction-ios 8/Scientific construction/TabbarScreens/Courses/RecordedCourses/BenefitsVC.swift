//
//  BenefitsVC.swift
//  Scientific construction
//
//  Created by Abdelrahman Saad on 4/20/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

import UIKit
import DropDown
class BenefitsVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var moreItems : [String] = ["تعديل","حذف","تحميل Word","تحميل PDF"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(cell: SummaryCell.self)
        // Do any additional setup after loading the view.
    }
}
extension BenefitsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as SummaryCell
        cell.actionButton = {
        let dropDown = DropDown()
                       dropDown.backgroundColor = .white
                       dropDown.textColor = .black
                       dropDown.anchorView = cell.MoreButton
                       dropDown.dataSource = self.moreItems
                       dropDown.selectionAction = { (index: Int , item: String) in
                   switch index {
                   default:
                      print(item)
                   }
               }
               dropDown.width = 100
               dropDown.show()
           }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = storyboard?.instantiateViewController(identifier: "BenefitsPresenter") as! BenefitsPresenter
        navigationController?.present(view, animated: true)
    }
    
    
}
