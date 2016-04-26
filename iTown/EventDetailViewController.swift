//
//  EventDetailViewController.swift
//  iTown
//
//  Created by Alessandro on 26/04/16.
//  Copyright © 2016 Alessandro Mignogna. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    var eventTitle : String = ""
    var eventDescription: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTitle.text = eventTitle
        labelDescription.text = eventDescription

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
