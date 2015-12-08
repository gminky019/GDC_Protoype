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
    var myActIndicator:UIActivityIndicatorView!
    //var alert:UIAlertView = UIAlertView()
    
    struct ArticleObj {
        var articleTitle : String!
        var articleArt : article

        
        init(key: String, value: article)
        {
            articleTitle = key
            articleArt = value
        }
    }
    
    var itemsArray = [ArticleObj]()
    var articles = [String: article] ()
    

    
    override func viewDidLoad() {
         startActivityIndicator()
        self.getArticles()
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())


    }
    
    func setUpTable()
    {
        self.ConvertDict()
        self.tableView = UITableView()
        self.tableView!.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.height-100)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView!)
    }
    
    func ConvertDict()
    {
        for(key, value) in self.articles{
            
            let temp = ArticleObj.init(key: key, value: value)
            
            self.itemsArray.append(temp)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemsArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell?
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "cell")
        }
        
        
        let singleArt = self.itemsArray[indexPath.row]
        
        
        cell!.textLabel?.text = singleArt.articleTitle
       // cell?.imageView?.image = UIImage(data: data!)
        
        return cell!
    }
    
    func startActivityIndicator()
    {
        self.myActIndicator = UIActivityIndicatorView(frame: CGRectMake(100, 100, 100, 100))
        
        self.myActIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        self.myActIndicator.center = self.view.center
        self.myActIndicator.startAnimating()
        
        self.view.addSubview(self.myActIndicator)
        

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "article")
        {
            var secondViewController : SelectedArticleCont = segue.destinationViewController as! SelectedArticleCont
            
            var indexPath = self.tableView?.indexPathForSelectedRow!
            
            secondViewController.articleData = self.itemsArray[indexPath!.row].articleArt
            
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("article", sender: indexPath)
    }
    
    func getArticles()
    {
       
        
        RESTConnect.instance.getArticles {json in
            
            
            let results = json["Articles"]
            
            
            for (index: String, subJson: JSON) in results{
                
                let newArt = article.init(title: JSON["Title"].string!, desc: JSON["Description"].string!, thumb: JSON["Thumbnail"].string!, text: JSON["MainText"].string!, date: JSON["Date"].string!, type: JSON["Type"].string!)
                self.articles[JSON["Title"].string!] = newArt
                
                
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                self.myActIndicator.removeFromSuperview()
                self.setUpTable()
            })
            
        }
        
    }
    
}