//
//  myClass.swift
//  Techno
//
//  Created by apple on 2/18/1441 AH.
//  Copyright © 1441 AH Softagi. All rights reserved.
//

import Foundation
import UIKit

class MyClass: NSObject {
    
    class myButton : UIButton {
        override var isHighlighted: Bool {
            didSet {
                if (isHighlighted) {
                    self.backgroundColor = UIColor.blue
                } else {
                    self.backgroundColor = UIColor.white
                }
            }
        }
    }
    
}
