//
//  CategoriesViewController.swift
//  Techno
//
//  Created by apple on 2/16/1441 AH.
//  Copyright © 1441 AH Softagi. All rights reserved.
//

import UIKit


class CategoriesViewController: UIViewController {

    @IBOutlet weak var projectButton: UIButton!
    
    @IBOutlet weak var targetButton: UIButton!
    @IBOutlet weak var costButton: UIButton!
    @IBOutlet weak var authoritiesButton: UIButton!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var importentFilesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        targetButton.alignVertical(spacing: 20)
        targetButton.setImage(UIImage(named: "target")?.withRenderingMode(.alwaysTemplate), for: .normal)
        targetButton.tintColor = UIColor(red: 0.20784, green: 0.72941, blue: 0.6823, alpha: 3.0);
        setButton(button: targetButton)
//        targetButton.setTitle("الأهداف", for: .normal)
//        targetButton.setTitleColor(UIColor(red: 0.20784, green: 0.72941, blue: 0.6823, alpha: 3.0), for: .normal)
//        targetButton.setTitleColor(UIColor.white, for: .highlighted)
//        targetButton.backgroundImage(for: .normal)
//       
        
        projectButton.alignVertical(spacing: 20)
        projectButton.setImage(UIImage(named: "presentation")?.withRenderingMode(.alwaysTemplate), for: .normal)
        projectButton.tintColor = UIColor(red: 0.20784, green: 0.72941, blue: 0.6823, alpha: 3.0);
        setButton(button: projectButton)
        
        costButton.alignVertical(spacing: 20)
        costButton.setImage(UIImage(named: "funds")?.withRenderingMode(.alwaysTemplate), for: .normal)
        costButton.tintColor = UIColor(red: 0.20784, green: 0.72941, blue: 0.6823, alpha: 3.0);
        setButton(button: costButton)
        
        authoritiesButton.alignVertical(spacing: 20)
        authoritiesButton.setImage(UIImage(named: "hotel")?.withRenderingMode(.alwaysTemplate), for: .normal)
        authoritiesButton.tintColor = UIColor(red: 0.20784, green: 0.72941, blue: 0.6823, alpha: 3.0);
        setButton(button: authoritiesButton)
        
        importentFilesButton.alignVertical(spacing: 10)
        importentFilesButton.setImage(UIImage(named: "unlink")?.withRenderingMode(.alwaysTemplate), for: .normal)
        importentFilesButton.tintColor = UIColor(red: 0.20784, green: 0.72941, blue: 0.6823, alpha: 3.0);
        setButton(button: importentFilesButton)
        
//        importentFilesButton.setImage(UIImage(named: "funds")?.withRenderingMode(.alwaysTemplate), for: .normal)
//        importentFilesButton.tintColor = .red
        setButton(button: changeButton)
        changeButton.alignVertical(spacing: 20)
        
       // targetButton.center = CGPoint(x: targetButton.bounds.width/2, y: targetButton.bounds.height/2)
    }



    @IBAction func targetButtonAction(_ sender: UIButton) {
        print ("pressed")
       
    }
    @IBAction func ProjectsButtonPressed(_ sender: UIButton) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "ProjectsViewController") as! ProjectsViewController
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func setButton(button : UIButton){
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 3.0
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowOpacity = 1.0
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.clear.cgColor
 
        button.imageView?.contentMode = .scaleAspectFit
        
        
    }
    

}
extension UIButton {
    func alignVertical(spacing: CGFloat = 0.6) {
        guard let imageSize = imageView?.image?.size,
            let text = titleLabel?.text,
            let font = titleLabel?.font
            else { return }
        
        titleEdgeInsets = UIEdgeInsets(
            top: 10.0,
            left: -imageSize.width,
            bottom: -(imageSize.height/2 ),
            right: 0.0
        )
        
        let titleSize = text.size(withAttributes: [.font: font])
        
        imageEdgeInsets = UIEdgeInsets(
            top: -(titleSize.height*2),
            left: -10.0,
            bottom: 0.0,
            right: -titleSize.width
        )
        
        let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0
        
        contentEdgeInsets = UIEdgeInsets(
            top: edgeOffset,
            left: 0.0,
            bottom: edgeOffset,
            right: 0.0
        )
    }
}
