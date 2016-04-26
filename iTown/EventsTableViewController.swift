//
//  EventsTableViewController.swift
//  iTown
//
//  Created by Alessandro on 26/04/16.
//  Copyright © 2016 Alessandro Mignogna. All rights reserved.
//

import UIKit

class EventsTableViewController: UITableViewController {
    
    var events : [Event] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let url = NSBundle.mainBundle().URLForResource("events", withExtension: "json")
        let data = NSData(contentsOfURL: url!)
        
        do {
            let object = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            if let dictionary = object as? [String: AnyObject] {
                readJSONObject(dictionary)
            }
        } catch {
            // Handle Error
        }
        
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return events.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("EventCell", forIndexPath: indexPath)

        let event = self.events[indexPath.row]
        
        cell.textLabel?.text = event.title

        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    //se viene selezionato una riga della tabella attiva il segue per spostarti nella View dei Dettagli
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("EventDetailSegue", sender: tableView)
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EventDetailSegue" {
            let eventDetailViewController = segue.destinationViewController as! EventDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow!
            let detailTitle = self.events[indexPath.row].title
            let detailDescription = self.events[indexPath.row].description
            eventDetailViewController.title = detailTitle
            eventDetailViewController.eventTitle = detailTitle
            eventDetailViewController.eventDescription = detailDescription
        }
    }
    
    
    func readJSONObject(object: [String: AnyObject]) {
        
        guard let jsonEvents = object["events"] as? [[String: AnyObject]] else { return }
        
        for json in jsonEvents {
            let jsonTitle = json["title"] as? String
            let jsonStartDate = json["startDate"] as? String
            let jsonEndDate = json["endDate"] as? String
            let jsonDescription = json["description"] as? String
            
            let start = convertDateFromJSON(jsonStartDate!)
            let end = convertDateFromJSON(jsonEndDate!)
            
            let event = Event(title: jsonTitle!, startDate: start, endDate: end, description: jsonDescription)
            self.events.append(event)
 
        }
    }
    
    func convertDateFromJSON(dateString: String) -> NSDate{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.dateFromString( dateString )!
    }
    
}


