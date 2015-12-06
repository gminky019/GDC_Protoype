//
//  Article.swift
//  GenericContent_Proto
//
//  Created by Garrett Minky on 12/6/15.
//  Copyright © 2015 Garrett Minky. All rights reserved.
//

import Foundation

class article {
    let Title, Desc, Thumb, Text: String
    
    init(title: String, desc: String, thumb: String, text: String)
    {
        self.Title = title
        self.Desc = desc
        self.Thumb = thumb
        self.Text = text
    }
}