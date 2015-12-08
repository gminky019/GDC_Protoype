//
//  Second.swift
//  GenericContent_Proto
//
//  Created by Garrett Minky on 12/3/15.
//  Copyright © 2015 Garrett Minky. All rights reserved.
//

import Foundation

class SelectedArticleCont: UIViewController{
    
    var articleData: article!
    var label: UILabel!
    var myActIndicator:UIActivityIndicatorView!
    var image: UIImage!
    var imageCache = [String: UIImage]()
    
    @IBOutlet weak var articleTitle: UILabel!
    
    @IBOutlet weak var articleType: UILabel!
    @IBOutlet weak var articleDate: UILabel!
    @IBOutlet weak var articleText: UITextView!
    @IBOutlet weak var articleMainPic: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
       
        getPic()
    //    var img: UIImage = UIImage.init()
        /*
        self.label = UILabel(frame: CGRectMake(100, 100, 100, 100))
        
        self.label.text = self.articleData.Title
        
        self.view.addSubview(self.label)
*/
        
    }
    
    
    func getPic()
    {
        startActivityIndicator()
        
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            
            let url: NSURL = NSURL(string: "https://c2.staticflickr.com/6/5127/5277006397_4ce2343886.jpg")!
            
            let data : NSData = NSData(contentsOfURL: url)!
            
            var test =  UIImage(data: data)!

            
            self.myActIndicator.removeFromSuperview()
            self.articleTitle.text = self.articleData.Title
            self.articleMainPic.image = test
            
            
        })
        

    }
    
    func startActivityIndicator()
    {
        self.myActIndicator = UIActivityIndicatorView(frame: CGRectMake(100, 100, 100, 100))
        
        self.myActIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        self.myActIndicator.center = self.view.center
        self.myActIndicator.startAnimating()
        
        self.view.addSubview(self.myActIndicator)
        
        
    }
}