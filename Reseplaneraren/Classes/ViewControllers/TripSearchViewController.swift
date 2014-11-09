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

class TripSearchViewController: UIViewController, CLLocationManagerDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

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
    
    let favourites = FavouriteDestination.allObjects()
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var favouritesCollectionView: UICollectionView!
    @IBOutlet weak var departureTimeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var originTextField: UITextField!
    @IBOutlet weak var destinationTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        favouritesCollectionView.delegate = self
        favouritesCollectionView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        locationManager.stopUpdatingLocation()
        
        if let newLocation = locations.last as? CLLocation {
            currentLocation = newLocation
            
            tripQuery.setOriginCoordinate(newLocation.coordinate)
            originTextField.text = "Min plats"
            
            var adjustedRegion = mapView.regionThatFits(MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 3000, 3000))
            mapView.setRegion(adjustedRegion, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func departureTimeChanged(sender: AnyObject) {
        let segmentedControl = sender as UISegmentedControl
        var newDepartureTime: NSDate
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            tripQuery.departureDelay = 0
            break
        case 1:
            tripQuery.departureDelay = 600
        case 2:
            tripQuery.departureDelay = 1800
        default:
            break
        }
    }
    
    @IBAction func searchButtonPressed(AnyObject) {
        if let _ = self.tripQuery.trips {
            self.performSegueWithIdentifier("SearchToResultSegue", sender: self)
        } else {
            self.tripQuery.fetchTripsWithSuccess({ (trips) -> () in
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.performSegueWithIdentifier("SearchToResultSegue", sender: self)
                })
            })
        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(favourites.count)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FavouriteCell", forIndexPath: indexPath) as FavouriteDestinationCollectionViewCell
        
        let favourite = favourites[UInt(indexPath.row)] as FavouriteDestination
        cell.favouriteDestination = favourite
        cell.backgroundColor = UIColor.darkGrayColor()
        cell.selectedBackgroundView = UIView(frame: CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height))
        cell.selectedBackgroundView.backgroundColor = view.tintColor
        
        return cell
    }
    
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let selectedFavourite = favourites[UInt(indexPath.row)] as FavouriteDestination
        
        destinationTextField.text = selectedFavourite.name
        
        tripQuery.setDestinationLocationId(selectedFavourite.locationId)
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        println("Preparing for segue, on main thread? \(NSThread.isMainThread())")
        
        let tripResultViewController = segue.destinationViewController as TripResultViewController
        tripResultViewController.trips = self.tripQuery.trips
    }
    

}
