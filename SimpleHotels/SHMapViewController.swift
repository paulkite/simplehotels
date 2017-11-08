//
//  SHMapViewController.swift
//  SimpleHotels
//
//  Created by Najmul Hasan on 11/7/17.
//  Copyright © 2017 Expedia, Inc. All rights reserved.
//

import UIKit
import MapKit

class SHMapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    public var latitude: String!
    public var longitude: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let location = CLLocationCoordinate2DMake( Double(latitude)!, Double(longitude)!)
        
        var region = MKCoordinateRegion()
        region.center = location
        region.span = MKCoordinateSpanMake(0.05, 0.05)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        mapView.addAnnotation(annotation)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

