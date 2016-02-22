//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Neill Chua on 2/9/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import UIKit


class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    
    override func viewWillAppear(animated: Bool){
        
        let hour = NSCalendar.currentCalendar().component(NSCalendarUnit.Hour, fromDate: NSDate())
        if (hour > 17 || hour < 6) {
            view.backgroundColor = UIColor(red:253, green:253, blue: 253, alpha: 1)
                
            }
        else {
            view.backgroundColor = UIColor.whiteColor()
        }
            
    }
    
    
    override func viewDidLoad() {
        // always call the super implementation of viewDidLoadsuper.viewDidLoad()
        
        print("ConversionViewController loaded its view.")
    }
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    } ()
    
    var fahrenheitValue: Double? {
        didSet{
        updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Double? {
        if let value = fahrenheitValue{
            return (value - 32)*(5/9)
        }
        else{
            return nil
        }
    }
    
    func updateCelsiusLabel(){
        if let value = celsiusValue{
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        }
        else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject){
        textField.resignFirstResponder()
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField){
        if let text = textField.text, value = Double(text) {
            fahrenheitValue = value
        }
        else {
            fahrenheitValue = nil
        }
}
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let currentLocale = NSLocale.currentLocale()
        let decimalSeparator =
            currentLocale.objectForKey(NSLocaleDecimalSeparator) as! String
        
        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(decimalSeparator)
        let replacementTextHasDecimalSeparator = string.rangeOfString(decimalSeparator)
        
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        }
        else {
            return true
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanges(textField: UITextField) {
        if let text = textField.text, let number = numberFormatter.numberFromString(text) {
            fahrenheitValue = number.doubleValue
        }
        else {
            fahrenheitValue = nil
        }
    }
    
}

      
    