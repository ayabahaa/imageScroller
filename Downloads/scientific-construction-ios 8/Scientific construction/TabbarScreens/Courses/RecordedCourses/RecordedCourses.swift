//
//  RecordedCourses.swift
//  Scientific construction
//
//  Created by Abdelrahman Saad on 4/16/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

import UIKit

class RecordedCourses: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
  var Avalible : AllCoursesModel?
       var arrayIsSelected: [Bool] =  [true, false, false, false, false, false]
       var id : Int?
       override func viewDidLoad() {
           super.viewDidLoad()
           getCoursesData(id: "0")
           collectionView.registerCellNib(cellClass: CoursesTappedCell.self)
           tableView.registerNib(cell: CoursesTableCell.self)
           collectionView.semanticContentAttribute = .forceRightToLeft
           // Do any additional setup after loading the view.
       }
       
       func getCoursesData(id : String){
           NetworkClient.performRequest(AllCoursesModel.self, router: .avalibleiCourses(token: userID!, type: "available_course", depertment: id), success: { [weak self] (models) in
               self?.Avalible = models
               print("courses is \( models.data?.byDepartment)")
               
             if(models.status == true){
                self?.collectionView.reloadData()
                self?.tableView.reloadData()
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
   extension RecordedCourses: UITableViewDelegate, UITableViewDataSource {
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

           return self.Avalible?.data?.availableCourse?.data?.count ?? 0
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           let cell = tableView.dequeue() as CoursesTableCell
           cell.label1.text = Avalible?.data?.availableCourse?.data?[indexPath.row].courseName
           cell.label2.text = Avalible?.data?.availableCourse?.data?[indexPath.row].userID?.name
           cell.label3.text = Avalible?.data?.availableCourse?.data?[indexPath.row].userID?.jobTitle
           cell.courseButton.backgroundColor = .red
           cell.courseButton.setTitle("الغاء التسجيل", for: .normal)
            cell.actionButton = {
                Utility.showAlertWithAction(withTitle: "البناء العلمي", message: "هل متأكد من إلغاء التسجيل ؟", delegate: nil, parentViewController: self) { (Response) in
                    Utility.showAlertMessage(withTitle: "البناء العلمي", message: "تم الغاء التسجيل بنجاح", delegate: nil, parentViewController: self)
                }
            print(123)
        }
           return cell
       }
     
    
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = storyboard?.instantiateViewController(identifier: "RecordedDetailsVC") as! RecordedDetailsVC
        self.navigationController?.pushViewController(view, animated: true)
       }
       
       
   }


   extension RecordedCourses: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return Avalible?.data?.departments?.count ?? 0
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeue(indexPath: indexPath) as CoursesTappedCell
           cell.CollectionTitle.text = Avalible?.data?.departments?[indexPath.row].departmentName
           if arrayIsSelected[indexPath.row] == true {
               cell.CollectionViewItem.backgroundColor = UIColor(red: 52/255.0, green: 190/255.0, blue: 151/255.0, alpha: 1.0)
               cell.CollectionTitle.textColor = .white
            
               
           }else {
               cell.CollectionViewItem.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
                           cell.CollectionTitle.textColor = .white
           }
           return cell
       }
      
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
                return 0
           }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width: CGFloat = (collectionView.frame.width  - CGFloat(integerLiteral: arrayIsSelected.count)) / 6
           return CGSize(width: width * 1.5, height: 60)
       }
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           for i in 0...(arrayIsSelected.count - 1 ) {
                         arrayIsSelected[i] = false
                    }
                    self.arrayIsSelected[indexPath.row] = true
                    self.collectionView.reloadData()
           switch indexPath.row {
           case 0:
               getCoursesData(id: "1")
                    
           case 1:
               getCoursesData(id: "2")

           case 2:
               getCoursesData(id: "3")

           case 3:
              getCoursesData(id: "4")

           case 4:
               getCoursesData(id: "5")

           default:
               getCoursesData(id: "6")
           }
       }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
                return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
           }
       
   }
