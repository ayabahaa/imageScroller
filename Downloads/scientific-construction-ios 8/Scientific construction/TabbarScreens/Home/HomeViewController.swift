//
//  HomeViewController.swift
//  Scientific construction
//
//  Created by apple on 4/7/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

import UIKit
import Kingfisher
class HomeViewController: UIViewController{
    @IBOutlet weak var CoursesCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var teacher : AllTeachersModel?
    var courses : AllCoursesModel?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
      updateUI()
        
       // print("teacher\(teacher)")
        // Do any additional setup after loading the view.
    }
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        navigationController?.setNavigationBarHidden(false, animated: true)

    }
    @IBAction func notificationBtn(_ sender: UIBarButtonItem) {
       let view = self.storyboard?.instantiateViewController(identifier: "NotificationsVC") as! NotificationsVC
        navigationController?.pushViewController(view, animated: true)
    }
    @objc func updateUI() {
        getCoursesData()
              getTeachersData()
              CoursesCollectionView.registerCellNib(cellClass: AvailableCoursesCell.self)
              tableView.registerNib(cell: HomeTableCell.self)
    }

       func getTeachersData(){
           
           NetworkClient.performRequest(AllTeachersModel.self, router: .teachers(token: userID!), success: { [weak self] (models) in
            
            self?.teacher = models
            print("models\( self?.teacher)")
              
            if(models.status == true){
                self?.tableView.reloadData()
                print("seccuse ")
            }
            else if (models.status == false ){
       //                     var mesg = models.message ?? ""
       //                     var masg2 = models.messages
                print("errorrr")
            }
                          
            }) { [weak self] (error) in
                self?.view.hideToastActivity()
                guard let error = error as? BaseError else { return }
                if case .other(let error) = error {
                              //self?.displayError(error )
                } else {
                              //self?.displayError(error.MyDescription)
                }
                             
              }
        }
    func getCoursesData(){
       
        NetworkClient.performRequest(AllCoursesModel.self, router: .avalibleiCourses(token: userID!, type: "available_course", depertment: "0"), success: { [weak self] (models) in
            self?.courses = models
            print("courses is \( self?.courses)")
           
         if(models.status == true){
            self?.CoursesCollectionView.reloadData()
             self?.view.hideToastActivity()
             print("seccuse ")
         }
         else if (models.status == false ){
           
    //                     var mesg = models.message ?? ""
    //                     var masg2 = models.messages
             print("errorrr")
         }
                       
         }) { [weak self] (error) in
             
             guard let error = error as? BaseError else { return }
             if case .other(let error) = error {
                           //self?.displayError(error )
             } else {
                           //self?.displayError(error.MyDescription)
             }
                          
           }
     }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses?.data?.departments?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as AvailableCoursesCell
        cell.departmentName.text = courses?.data?.departments?[indexPath.row].departmentName
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3.5, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
    }
    
}
extension HomeViewController :UITableViewDelegate, UITableViewDataSource {
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return teacher?.data?.data?.count ?? 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
            let cell = tableView.dequeue() as HomeTableCell
         cell.teacherName.text = teacher?.data?.data?[indexPath.row].name
            cell.jobTitle.text = teacher?.data?.data?[indexPath.row].jobTitle
            cell.courseCount.text = teacher?.data?.data?[indexPath.row].coursesCount
            let url = teacher?.data?.data?[indexPath.row].photo
            let image = Constants.baseImageUrl + (url ?? "")
            let myImage = URL(string: image)
            cell.teacherImage.kf.setImage(with: myImage)
            return cell
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150
        }
}
