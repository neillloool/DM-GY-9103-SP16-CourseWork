//
//  counterViewController.swift
//  counterapp
//
//  Created by Neill Chua on 3/22/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import UIKit

class CounterViewController: UIViewController {
    
    
    var countValue: Int!
    
    @IBOutlet var counter: UILabel!
    
    override func viewDidLoad() {
        countValue=0
        super.viewDidLoad()
        counter.text = String(countValue)
    }
    
    @IBAction func addValue(sender: AnyObject) {
        
        countValue = countValue+1
        counter.text = String(countValue)
    }
    
    @IBAction func subtractValue(sender: AnyObject) {
        
        if countValue <= 0
            {
            countValue = 0
            counter.text = String(countValue)
            }
        else
            {
            countValue = countValue-1
            counter.text = String(countValue)
            }
    }
}