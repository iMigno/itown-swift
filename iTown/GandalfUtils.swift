//
//  GandalfUtils.swift
//  iTown
//
//  Created by Alessandro on 29/04/16.
//  Copyright © 2016 Alessandro Mignogna. All rights reserved.
//

import Foundation


class GandalfUtils{
    
    // convert a string into a date
    class func fromStringToDate(dateString: String) -> NSDate{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.dateFromString( dateString )!
    }

}