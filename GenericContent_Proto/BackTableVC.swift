//
//  BackTableVC.swift
//  GenericContent_Proto
//
//  Created by Garrett Minky on 12/3/15.
//  Copyright © 2015 Garrett Minky. All rights reserved.
//

import Foundation

class BackTableVC : UITableViewController{
    
    var TableArray = [String]()
    
    override func viewDidLoad() {
        TableArray = ["Hello","Second","Article_List", "Articles"]
        
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(TableArray[indexPath.row], forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = TableArray[indexPath.row]
        
        return cell
    }

}