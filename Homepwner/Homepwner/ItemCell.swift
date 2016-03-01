//
//  ItemCell.swift
//  Homepwner
//
//  Created by Neill Chua on 2/29/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit



class ItemCell: UITableViewCell{
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    
    func updateLabels() {
        let bodyFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        nameLabel.font = bodyFont
        valueLabel.font = bodyFont
        
        let caption1Font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        serialNumberLabel.font = caption1Font
    }
    
    func updateValueLabelColor(value: Int){
        if value >= 50 {
            valueLabel.textColor = UIColor.redColor()
        } else {
            valueLabel.textColor = UIColor.greenColor()
        }
    }
}
