//
//  TownViewController.swift
//  iTown
//
//  Created by Alessandro on 26/04/16.
//  Copyright © 2016 Alessandro Mignogna. All rights reserved.
//

import UIKit

class TownViewController: UITableViewController {
    
    
    struct MenuRow {
        let title : String
    }
    
    var menuList = [MenuRow]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.menuList = [
            MenuRow(title: "Notizie"),
            MenuRow(title: "Comunicati")
        ]
        
        
        //aggiorna la tabella ricaricando le funzioni
        self.tableView.reloadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

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
        return menuList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("TownCell", forIndexPath: indexPath)
        
        //ricavo un oggetto Alimento dalla lista in posizione row (il num di riga) e lo conservo
        let menuRow = self.menuList[indexPath.row]
        
        //riempio la cella assegnando ad una label testuale il nome dell'alimento
        cell.textLabel?.text = menuRow.title
        // questo accessorio aggiunge il bottone a forma di freccia che punta verso destra (utile per indicare che cliccando la vista si sposta in un altro VC)
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    //se viene selezionato una riga della tabella attiva il segue per spostarti nella View dei Dettagli
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row == 0){
            self.performSegueWithIdentifier("NewsSegue", sender: tableView)
        }
        
        if(indexPath.row == 1){
            self.performSegueWithIdentifier("PressSegue", sender: tableView)
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "NewsSegue" {
            let destinationController = segue.destinationViewController as! NewsTableViewController
            //let indexPath = self.tableView.indexPathForSelectedRow!
            //let detailEvent = self.events[indexPath.row]
            // eventDetailViewController.event = detailEvent
            destinationController.title = "Notizie"
        }
        
        if segue.identifier == "PressSegue" {
            let destinationController = segue.destinationViewController as! PressTableViewController
            //let indexPath = self.tableView.indexPathForSelectedRow!
            //let detailEvent = self.events[indexPath.row]
            // eventDetailViewController.event = detailEvent
            destinationController.title = "Comunicati"
        }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
