//
//  QuestionPresenter.swift
//  Scientific construction
//
//  Created by Abdelrahman Saad on 4/20/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

import UIKit

class QuestionPresenter: UIViewController, UITextViewDelegate {
    @IBOutlet weak var QuestionView: UITextView!
    @IBOutlet weak var placeholderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                QuestionView.delegate = self
              placeholderLabel.text = "سؤالك..."
              placeholderLabel.sizeToFit()
              QuestionView.addSubview(placeholderLabel)
              placeholderLabel.frame.origin = CGPoint(x: 5, y: (QuestionView.font?.pointSize)! / 2)
              QuestionView.frame.origin = CGPoint(x: 5, y: (QuestionView.font?.pointSize)! )
              placeholderLabel.textColor = UIColor.lightGray
              QuestionView.isHidden = !QuestionView.text.isEmpty
        // Do any additional setup after loading the view.
    }
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !QuestionView.text.isEmpty
    }
   
    @IBAction func QuestionSendPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
