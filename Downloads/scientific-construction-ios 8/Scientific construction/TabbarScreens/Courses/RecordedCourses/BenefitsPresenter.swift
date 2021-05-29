//
//  BenefitsPresenter.swift
//  Scientific construction
//
//  Created by Abdelrahman Saad on 4/20/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

import UIKit

class BenefitsPresenter: UIViewController, UITextViewDelegate {
    @IBOutlet weak var BenefitsView: UITextView!
    var placeholderLabel : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
            BenefitsView.delegate = self
            placeholderLabel = UILabel()
            placeholderLabel.text = "محتوي الفائدة"
            placeholderLabel.sizeToFit()
            BenefitsView.addSubview(placeholderLabel)
            placeholderLabel.frame.origin = CGPoint(x: 5, y: (BenefitsView.font?.pointSize)! / 2)
            BenefitsView.frame.origin = CGPoint(x: 5, y: (BenefitsView.font?.pointSize)! )
            placeholderLabel.textColor = UIColor.lightGray
            BenefitsView.isHidden = !BenefitsView.text.isEmpty
        // Do any additional setup after loading the view.
    }
    func textViewDidChange(_ textView: UITextView) {
              placeholderLabel.isHidden = !BenefitsView.text.isEmpty
          }
    @IBAction func BenefitsSentPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
