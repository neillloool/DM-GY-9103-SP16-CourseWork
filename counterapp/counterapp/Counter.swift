//
//  counter.swift
//  counterapp
//
//  Created by Neill Chua on 3/22/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import Foundation

class Counter: NSObject{

var countername: String
var count: Int


 init(name: String, count: Int){
    
    self.countername = name
    self.count = count
    
    super.init()
}

}