//
//  MoreVC.swift
//  Scientific construction
//
//  Created by Abdelrahman Saad on 4/18/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

import UIKit

class MoreVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var ImagesData: [UIImage] = [UIImage(named: "QuestionsImage")!,
                                 UIImage(named: "SummarizationImage")!,
                                 UIImage(named: "LikesImages")!,
                                 UIImage(named: "slideshowImage")!,
                                 UIImage(named: "RatingImage")!,]
    var textData : [String] = ["تساؤلات","تلخيص","فوائد","عرض الشرائح","التقييم"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.registerNib(cell: MoreCell.self)
    }

}
extension MoreVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ImagesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as MoreCell
        cell.textLabel?.text = textData[indexPath.row]
        cell.imageView?.image = ImagesData[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
             let view = storyboard?.instantiateViewController(identifier: "QuestionPresenter") as! QuestionPresenter
                   self.navigationController?.present(view ,animated: true)
        case 1:
            let view = storyboard?.instantiateViewController(identifier: "SummaryVC") as! SummaryVC
            self.navigationController?.pushViewController(view, animated: true)
        case 2:
            let view = storyboard?.instantiateViewController(identifier: "BenefitsVC") as! BenefitsVC
            self.navigationController?.pushViewController(view, animated: true)
        default:
            return
        }
       
    }
}
