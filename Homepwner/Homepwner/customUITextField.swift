//
//  customUITextField.swift
//  Homepwner
//
//  Created by Neill Chua on 3/20/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    
    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        
        self.borderStyle = .Line
        
        return true
        
    }
    
    override func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        
        self.borderStyle = .RoundedRect
        
        return true
    }
    
}
