//
//  Event.swift
//  iTown
//
//  Created by Alessandro on 26/04/16.
//  Copyright © 2016 Alessandro Mignogna. All rights reserved.
//

import Foundation

class Event{

    var title : String?
    var startDate : NSDate?
    var endDate : NSDate?
    var description : String?
    
    init(title: String, startDate: NSDate?, endDate: NSDate?, description: String?) {
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.description = description
    }

}