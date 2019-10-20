//
//  ProjectsViewController.swift
//  Techno
//
//  Created by Abdelrahman Saad on 10/20/19.
//  Copyright © 2019 Softagi. All rights reserved.
//

import UIKit
import Alamofire
class ProjectsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
//    var data = [ProjectsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(cell: ProjectsCell.self)
        loadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as ProjectsCell
        return cell
    }
    func loadData(){
       
        Alamofire.request("http://saqah.com/api/places", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (MyResponse) in
            do {
                let places = try JSONDecoder().decode(ProjectsModel.self, from: MyResponse.data!)
                self.data = places
                self.tableView.reloadData()
               
                
                
            }
            catch let error {
                print("Error \(error)")
            }
        }
    }
}
