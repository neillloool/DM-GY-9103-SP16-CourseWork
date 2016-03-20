//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Neill Chua on 3/6/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit
class DetailViewController: UIViewController, UITextFieldDelegate{
    @IBAction func backgroundTapped(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBOutlet var serialNumberFIeld: UITextField!
    @IBOutlet var nameField: CustomTextField!
    @IBOutlet var serialNumberField: CustomTextField!
    @IBOutlet var valueField: CustomTextField!
    
    
    var item: Item! {
        didSet {
        navigationItem.title = item.name
        }
    }
    
    let numberFormatter: NSNumberFormatter = {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .DecimalStyle
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    let dateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .NoStyle
        return formatter
    }()

    
    override func viewWillAppear(animated: Bool){
        
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        serialNumberFIeld.text = item.serialNumber
        valueField.text = numberFormatter.stringFromNumber(item.valueInDollars)
        valueField.keyboardType = UIKeyboardType.NumberPad
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Clear first responder
        view.endEditing(true)
        
        // "Save" changes to item
        item.name = nameField.text ?? ""
        item.serialNumber = serialNumberFIeld.text
        
        if let valueText = valueField.text,
            let value = numberFormatter.numberFromString(valueText) {
            item.valueInDollars = value.integerValue
        }
        else {
            item.valueInDollars = 0
        }
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
}

