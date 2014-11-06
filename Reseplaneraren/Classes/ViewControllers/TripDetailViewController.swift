//
//  TripDetailViewController.swift
//  Reseplaneraren
//
//  Created by Johan Larsson on 2014-11-06.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import UIKit

class TripDetailViewController: UITableViewController {
    
    var trip: Trip?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let legCount = trip?.legs.count {
            return legCount
        }
        
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "TripDetailLegCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as LegCell
        
        cell.tripLeg = trip?.legs[indexPath.row]
        
        return cell
    }

}
