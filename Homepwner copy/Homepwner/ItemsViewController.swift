//
//  ItemsViewController.swift
//  Homepwner
//

//To be able to store elements of different types in an array:
struct Section {
    let title: String
    let items: [Item]
}

import UIKit

class ItemsViewController: UITableViewController {
    
    @IBOutlet var cellForTableFooter: UITableViewCell!
    
    var itemStore: ItemStore!
    var sections: [Section] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //itemStore.allItems = []  //For testing requirements of Silver Challenge
        
        createInsetsForTableView()
        splitItemStoreIntoCheapAndValuableSections()
        addTableFooterView()
    }
    
    //MARK: Custom methods:
    
    func addTableFooterView() {
        
        //From Chapter 1:
        let footerFrame = CGRect(
            x: 0,
            y: 0,
            width: tableView.frame.width,
            height: 40)
        
        let footerView = UIView(frame: footerFrame)
        footerView.backgroundColor = UIColor.orangeColor()
        
        let footerLabel = UILabel(frame: footerFrame)
        footerLabel.text = "No More Items"
        footerLabel.textAlignment = .Center
        
        footerView.addSubview(footerLabel)
        tableView.tableFooterView = footerView
    }
    
    func createInsetsForTableView() {
        
        let statusBarHeight =
            UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(
            top: statusBarHeight,
            left: 0,
            bottom: 0,
            right: 0
        )
        
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
    }
    
    func splitItemStoreIntoCheapAndValuableSections() {
        
        var lowCostItems: [Item] = []
        var valuables: [Item] = []
        
        for item in itemStore.allItems {
            if item.valueInDollars <= 50 {
                lowCostItems.append(item)
            }
            else {
                valuables.append(item)
            }
        }
        
        sections.append(Section(
            title: "Low Cost Items",
            items: lowCostItems)
        )
        
        sections.append(Section(
            title: "Valuables",
            items: valuables)
        )
        
        //For implementing  GlennRay36's solution:
        /*
         sections.append(Section(
         title: "No More Items",
         items: [])
         )
         */
    }
    
    //MARK: UITableViewDataSource delegate methods:
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(tableView: UITableView,
                  numberOfRowsInSection section: Int) -> Int
    {
        return sections[section].items.count
    }
    
    override func tableView(tableView: UITableView,
                  titleForHeaderInSection section: Int) -> String?
    {
        return sections[section].title
    }
    
    override func tableView(tableView: UITableView,
                  cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        /*Despite what the docs say, the following is not needed for
         a cell in a storyboard  (Matt Neuburg , iOS9: google previews)
         
         viewDidLoad() {
         tableView.registerClass(
         UITableViewCell.self,
         forCellReuseIdentifier: "UITableViewCell-RightDetail"
         )
         }
         */
        
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "UITableViewCell-RightDetail",
            forIndexPath: indexPath
        )
        let section = sections[indexPath.section] //Exception if invalid index
        let item = section.items[indexPath.row]   //Exception if invalid index
        
        cell.textLabel?.text = item.name  //If textLabel doesn't exist, nothing is done.
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
    
    /*For alternating row color(Looks terrible!):
     override func tableView(tableView: UITableView,
     willDisplayCell cell: UITableViewCell,
     forRowAtIndexPath indexPath: NSIndexPath)
     {
     
     let cellContentView = cell.contentView
     
     if indexPath.row % 2 == 0 {
     cellContentView.backgroundColor = UIColor.whiteColor()
     }
     else {  //If you don't include the else, all the rows will be the same color when you scroll.
     cellContentView.backgroundColor = UIColor.lightGrayColor()
     }
     }
     */
}