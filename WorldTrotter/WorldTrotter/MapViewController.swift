//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Neill Chua on 2/14/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView(){
        
        //create a map view
        mapView  = MKMapView()
        
        //set it as *the* view of this view controller
        view = mapView
        
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        let segmentedControl = UISegmentedControl(items: [standardString, satelliteString, hybridString])
        
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: "MapTypeChanged:", forControlEvents: .ValueChanged)
        
        func mapTypeChanged(segControl: UISegmentedControl){
            switch segmentedControl.selectedSegmentIndex{
            case 0: mapView.mapType = .Standard
            case 1: mapView.mapType = .Hybrid
            case 2: mapView.mapType = .Satellite
            default: break
            }
        }
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
        
    }
    
    override func viewDidLoad() {
        //Always call the super implementation of viewDidLoadsuper.viewDidLoad()
        
        print("MapViewController loaded its view.")
    }
    
}