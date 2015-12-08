//
//  BaseVideoController.swift
//  GenericContent_Proto
//
//  Created by Garrett Minky on 12/7/15.
//  Copyright © 2015 Garrett Minky. All rights reserved.
//

import Foundation

//
//  Second.swift
//  GenericContent_Proto
//
//  Created by Garrett Minky on 12/3/15.
//  Copyright © 2015 Garrett Minky. All rights reserved.
//

import Foundation

class BaseVideoController: UIViewController{
    
    var videoData: Video!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        
    }
    

}