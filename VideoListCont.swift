//
//  VideoListCont.swift
//  GenericContent_Proto
//
//  Created by Garrett Minky on 12/3/15.
//  Copyright © 2015 Garrett Minky. All rights reserved.
//

import Foundation

class VideoListCont: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView:UITableView?
    var myActIndicator:UIActivityIndicatorView!
    var alert:UIAlertView = UIAlertView()
    
    struct VideoObj {
        var videoTitle : String!
        var videoVid : Video
        
        
        init(key: String, value: Video)
        {
            videoTitle = key
            videoVid = value
        }
    }
    
    var itemsArray = [VideoObj]()
    var videos = [String: Video] ()
    
    
    
    override func viewDidLoad() {
        startActivityIndicator()
        self.getVideos()
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
        for(key, value) in self.videos{
            
            let temp = VideoObj.init(key: key, value: value)
            
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
        
        
        let singleVid = self.itemsArray[indexPath.row]
        
        
        cell!.textLabel?.text = singleVid.videoTitle
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
        if(segue.identifier == "video")
        {
            var secondViewController : BaseVideoController = segue.destinationViewController as! BaseVideoController
            
            var indexPath = self.tableView?.indexPathForSelectedRow!
            
            secondViewController.videoData = self.itemsArray[indexPath!.row].videoVid
            
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("video", sender: indexPath)
    }
    
    func getVideos()
    {
        
        
        RESTConnect.instance.getVideos{json in
            
            
            let results = json["Videos"]
            
            
            for (index: String, subJson: JSON) in results{
                
                let newVid = Video.init(title: JSON["Title"].string!, desc: JSON["Description"].string!, link: JSON["Link"].string!)
                self.videos[JSON["Title"].string!] = newVid
                
                
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                self.myActIndicator.removeFromSuperview()
                self.setUpTable()
            })
            
        }
        
    }
    
}