//
//  ViewController.swift
//  MapSpotDemo
//
//  Created by Kasra Koushan on 2016-06-08.
//  Copyright © 2016 Kasra Koushan. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var map: MKMapView!
    
    var spotList = Spot.spotList()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.table.dataSource = self
        self.table.delegate = self
        
        self.map.mapType = MKMapType.Hybrid
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.spotList.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let spot = self.spotList[indexPath.row]
        self.map.addAnnotation(spot)
        self.table.deselectRowAtIndexPath(indexPath, animated: true)
        
        self.map.setCenterCoordinate(spot.coordinate, animated: true)
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: spot.coordinate, span: span)
        self.map.setRegion(region, animated: true)
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // return the cell
        let spot = self.spotList[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = spot.title
        return cell
    }
    

}

