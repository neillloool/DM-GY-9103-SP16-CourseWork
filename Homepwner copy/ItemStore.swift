//
//  ItemStore.swift
//  Homepwner
//
//  Created by Neill Chua on 2/22/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import UIKit

class ItemStore{
    
    var allItems = [Item]()
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
    func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
}
