//
//  TripSearchViewController.swift
//  Reseplaneraren
//
//  Created by Johan Larsson on 2014-10-29.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class TripSearchViewController: UIViewController, CLLocationManagerDelegate {

    required init(coder aDecoder: NSCoder) {
        
        locationManager = CLLocationManager()
        tripQuery = TripQuery()
        
        super.init(coder: aDecoder)
    }
    
    var trips: [Trip] = []
    
    var managedObjectContext: NSManagedObjectContext? = nil
    
    var locationManager: CLLocationManager! = nil
    var currentLocation: CLLocation?
    
    var tripQuery: TripQuery
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var favouritesCollectionView: UICollectionView!
    @IBOutlet weak var departureTimeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        tripQuery.setDestinationLocationId("9021014001980000")
        
        // Do any additional setup after loading the view.
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        locationManager.stopUpdatingLocation()
        
        if let newLocation = locations.last as? CLLocation {
            currentLocation = newLocation
            
            tripQuery.setOriginCoordinate(newLocation.coordinate)
            tripQuery.prefetchTripsIfPossible()
            
            var adjustedRegion = mapView.regionThatFits(MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 3000, 3000))
            mapView.setRegion(adjustedRegion, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func departureTimeChanged(AnyObject) {
        
    }
    
    @IBAction func searchButtonPressed(AnyObject) {
        if let _ = self.tripQuery.trips {
            self.performSegueWithIdentifier("SearchToResultSegue", sender: self)
        } else {
            self.tripQuery.fetchTripsWithSuccess({ (trips) -> () in
                self.performSegueWithIdentifier("SearchToResultSegue", sender: self)
            })
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let tripResultViewController = segue.destinationViewController as TripResultViewController
        tripResultViewController.trips = self.tripQuery.trips
    }
    

}
