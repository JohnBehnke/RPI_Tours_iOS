//
//  SettingsViewController.swift
//  RPI Tours
//
//  Created by John Behnke on 3/30/16.
//  Copyright © 2016 RPI Web Tech. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    let defaults = NSUserDefaults.standardUserDefaults()

    
    //MARK: IBOutlets
    
    @IBOutlet var measurementTypeSelector: UISegmentedControl!
    @IBOutlet var accuracySlider: UISlider!
    
    
    //MARK: IBActions
    //Save any settings
    @IBAction func triggeredSave(sender: AnyObject) {
        
        //Load the store
        
        //Set the setting
        self.defaults.setObject(measurementTypeSelector.titleForSegmentAtIndex(measurementTypeSelector.selectedSegmentIndex), forKey: "system")
        self.defaults.setObject(measurementTypeSelector.selectedSegmentIndex, forKey: "savedIndex")
        
        //Prompt the user with an alert
        let alert = UIAlertController(title: "System", message: "Settings Saved!", preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {
            (_)in
            //self.performSegueWithIdentifier("cancelTour", sender: self)
        })
        //Present the alert
        alert.addAction(OKAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    //MARK: System Functions
    override func viewDidLoad() {
        
        if self.defaults.objectForKey("savedIndex") != nil{
            
        self.measurementTypeSelector.selectedSegmentIndex = ((self.defaults.objectForKey("savedIndex")) as? Int)!
        }

        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
