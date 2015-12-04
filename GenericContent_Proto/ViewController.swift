//
//  ViewController.swift
//  GenericContent_Proto
//
//  Created by Garrett Minky on 12/3/15.
//  Copyright © 2015 Garrett Minky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var OPen: UIBarButtonItem!
    
    var varView = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        OPen.target = self.revealViewController()
        
        OPen.action = Selector("revealToggle:")
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        if(varView == 0 ){
            Label.text = "Strings"
        }
        else{
            Label.text = "Others"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

