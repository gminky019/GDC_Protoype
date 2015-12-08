//
//  Video.swift
//  GenericContent_Proto
//
//  Created by Garrett Minky on 12/7/15.
//  Copyright © 2015 Garrett Minky. All rights reserved.
//

import Foundation
class Video {
    var Title: String!
    var Desc: String!
    var Link: String!
    
    init(title: String, desc: String, link: String)
    {
        self.Title = title
        self.Desc = desc
        self.Link = link
    }
}