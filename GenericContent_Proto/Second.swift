//
//  Second.swift
//  GenericContent_Proto
//
//  Created by Garrett Minky on 12/3/15.
//  Copyright © 2015 Garrett Minky. All rights reserved.
//

import Foundation

class Second: UIViewController {
    override func viewDidLoad() {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}