//
//  TripResultViewController.swift
//  Reseplaneraren
//
//  Created by Johan Larsson on 2014-11-05.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import UIKit
import MapKit

class TripResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    var trips: [Trip]? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        
        println("configureView")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("View did load")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View Data Source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let numberOfTrips = self.trips?.count {
            return numberOfTrips
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "TripCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as TripCell
        cell.trip = self.trips?[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("ResultToDetailSegue", sender: self)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = self.tableView.indexPathForSelectedRow()
        
        let tripDetailViewController = segue.destinationViewController as TripDetailViewController
        
        if let row = indexPath?.row {
            tripDetailViewController.trip = trips?[row]
        }
    }
    

}
