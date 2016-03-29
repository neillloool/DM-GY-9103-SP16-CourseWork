//
//  counterListViewController.swift
//  counterapp
//
//  Created by Neill Chua on 3/22/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import UIKit

class CounterListViewController: UITableViewController
{
    var counterDataStore: CounterDataStore!
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return counterDataStore.allCounterData.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
        let counter = counterDataStore.allCounterData[indexPath.row]
        
        cell.textLabel?.text = counter.countername
        cell.detailTextLabel?.text = String(counter.count)
        
        return cell
    }
    
}

