//
//  CounterDataStore.swift
//  counterapp
//
//  Created by Neill Chua on 3/22/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import UIKit

class CounterDataStore
{
   var allCounterData = [Counter]()

    func moveItemsAtIndex(fromIndex: Int, toIndex: Int)
    {
        if fromIndex == toIndex {
            return
        }
    }
    
    func createCounterItem() -> Counter {
        let newCounterItem = Counter(name: "Neil", count: 0)
        allCounterData.append(newCounterItem)
        return newCounterItem
    }
    
    func removeCounterItem(counter: Counter) {
        if let index = allCounterData.indexOf(counter)
        {
           allCounterData.removeAtIndex(index)
        }
    }
    
    init() {
        for _ in 0..<5 {
            createCounterItem()
        }
    }
    
}