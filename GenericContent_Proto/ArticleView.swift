//
//  ArticleView.swift
//  GenericContent_Proto
//
//  Created by Garrett Minky on 12/6/15.
//  Copyright © 2015 Garrett Minky. All rights reserved.
//

import Foundation
import UIKit


class ArticleView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView:UITableView?
    var items = NSMutableArray()
    
    override func viewDidLoad() {
        self.getArticles()
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    /*
    override func viewWillAppear(animated: Bool) {
        let frame:CGRect = CGRect(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.height-100)
        self.tableView = UITableView(frame: frame)
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.view.addSubview(self.tableView!)
       
        /*
        let btn = UIButton(frame: CGRect(x: 0, y: 25, width: self.view.frame.width, height: 50))
        btn.backgroundColor = UIColor.cyanColor()
        btn.setTitle("Add new Dummy", forState: UIControlState.Normal)
        btn.addTarget(self, action: "addDummyData", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)*/
    }*/
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("CELL") as UITableViewCell?
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "CELL")
        }
        
        let user:JSON =  JSON(self.items[indexPath.row])
        
        let picURL = user["picture"]["medium"].string
        let url = NSURL(string: picURL!)
        let data = NSData(contentsOfURL: url!)
        
        cell!.textLabel?.text = user["username"].string
        cell?.imageView?.image = UIImage(data: data!)
        
        return cell!
    }
    
    func getArticles()
    {
        RESTConnect.instance.getArticles {json in
            let results = json["results"]
            
            for (index: String, subObj: JSON) in results{
                
            }
            
        }
    }
    
}