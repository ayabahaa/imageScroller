
//
//  SearchVC.swift
//  Scientific construction
//
//  Created by Abdelrahman Saad on 4/13/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var SearchView: UIView!
    @IBOutlet weak var SearchImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
       
        // Do any additional setup after loading the view.
    }
    @objc func tapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let view = self.storyboard?.instantiateViewController(identifier: "Search_1_VC") as! Search_1_VC
        navigationController?.pushViewController(view, animated: true)
    }
    @objc func updateUI() {
                 collectionView.registerCellNib(cellClass: AvailableCoursesCell.self)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped(tapGestureRecognizer:)))
               SearchImage.isUserInteractionEnabled = true
               SearchImage.addGestureRecognizer(tapGestureRecognizer)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationItem.leftBarButtonItem?.isEnabled = true
       }
    
   

}
extension SearchVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as AvailableCoursesCell
        cell.ShekhDetailsStack.isHidden = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 4, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
       }
}
