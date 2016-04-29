//
//  JsonSingleton.swift
//  iTown
//
//  Created by Alessandro on 29/04/16.
//  Copyright © 2016 Alessandro Mignogna. All rights reserved.
//

import Foundation

class JsonSingleton{
    
    static let sharedInstance = JsonSingleton()
    
    func getJsonData() -> JSON{
        let url = NSBundle.mainBundle().URLForResource("data", withExtension: "json")
        let data = NSData(contentsOfURL: url!)
        let json = JSON(data: data!)
        
        return json
    }
    
    
    func getEvents() -> [Event] {
        var events : [Event] = []
        
        let json : JSON = self.getJsonData()
        
        if let items = json["events"].array {
            for item in items {
                if let title = item["title"].string {
                    let event : Event = Event()
                    event.title = title
                    
                    if let startDate = item["startDate"].string {
                        event.startDate = GandalfUtils.fromStringToDate(startDate)
                    }
                    
                    if let endDate = item["endDate"].string {
                        event.endDate = GandalfUtils.fromStringToDate(endDate)
                    }
                    
                    if let description = item["description"].string {
                        event.description = description
                    }
                          
                    events.append(event)
                }
            }
        }
        
        return events;
    }
    
    func getNews() -> [News] {
        var newsList : [News] = []
        
        let json : JSON = self.getJsonData()
        
        if let items = json["news"].array {
            for item in items {
                if let title = item["title"].string {
                    let news : News = News()
                    news.title = title
                    
                    if let description = item["description"].string {
                        news.description = description
                    }
                    
                    newsList.append(news)
                }
            }
        }
        
        return newsList;
    }
    
}