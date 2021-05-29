//
//  ChaptersVC.swift
//  Scientific construction
//
//  Created by Abdelrahman Saad on 4/18/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

import UIKit

class ChaptersVC: UIViewController {
    @IBOutlet weak var tableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVIew.registerNib(cell: ChaptersCell.self)
        // Do any additional setup after loading the view.
    }
   

}

extension ChaptersVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as ChaptersCell
        return cell 
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = storyboard?.instantiateViewController(identifier: "ChapterDetails") as! ChapterDetails
        navigationController?.pushViewController(view, animated: true)
    }
    
}
