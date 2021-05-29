//
//  SummaryPresenter.swift
//  Scientific construction
//
//  Created by Abdelrahman Saad on 4/20/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

import UIKit

class SummaryPresenter: UIViewController, UITextViewDelegate {
    @IBOutlet weak var SummaryView: UITextView!
    var placeholderLabel : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
                    SummaryView.delegate = self
                    placeholderLabel = UILabel()
                    placeholderLabel.text = "محتوي الملخص"
                    placeholderLabel.sizeToFit()
                    SummaryView.addSubview(placeholderLabel)
                    placeholderLabel.frame.origin = CGPoint(x: 5, y: (SummaryView.font?.pointSize)! / 2)
                    SummaryView.frame.origin = CGPoint(x: 5, y: (SummaryView.font?.pointSize)! )
                    placeholderLabel.textColor = UIColor.lightGray
                    SummaryView.isHidden = !SummaryView.text.isEmpty
        // Do any additional setup after loading the view.
    }
    func textViewDidChange(_ textView: UITextView) {
           placeholderLabel.isHidden = !SummaryView.text.isEmpty
       }
    @IBAction func SummarySentPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
