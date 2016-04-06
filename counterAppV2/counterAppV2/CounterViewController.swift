//
//  ViewController.swift
//  counterAppV2
//
//  Created by Neill Chua on 4/5/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import UIKit

class CounterViewController: UIViewController {
    
   /// var counter: Counter!
   /// var counterStore: CounterStore!
    
    var counter: Int = 0
    
    @IBOutlet var counterName: UITextField!
    @IBOutlet var counterLabel: UILabel!
    
   
    @IBAction func subtractButton(sender: AnyObject)
    {
        if counter > 0
        {
        
        counter = counter-1
            
        }
        
        counterLabel.text = String(counter)
        
    }
    
    
    @IBAction func addButton(sender: AnyObject)
    {
        if counter >= 0
        {
            counter = counter+1
            
        }
        
        counterLabel.text = String(counter)

    }
    
    
    
    
 

}

