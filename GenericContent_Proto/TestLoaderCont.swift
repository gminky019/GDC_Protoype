//
//  TestLoaderCont.swift
//  GenericContent_Proto
//
//  Created by Garrett Minky on 12/6/15.
//  Copyright © 2015 Garrett Minky. All rights reserved.
//

import Foundation

class TestLoaderCont: UIViewController{
    
    var articleData: article!
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.label = UILabel(frame: CGRectMake(100, 100, 100, 100))
        
        self.label.text = self.articleData.Title
        
        self.view.addSubview(self.label)
        
    }
}