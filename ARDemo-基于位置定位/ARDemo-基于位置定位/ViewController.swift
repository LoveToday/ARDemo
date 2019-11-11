//
//  ViewController.swift
//  ARDemo-基于位置定位
//
//  Created by 陈江林 on 2019/11/11.
//  Copyright © 2019 陈江林. All rights reserved.
//

import UIKit
import MapKit
import GooglePlaces
import HDAugmentedReality

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    fileprivate let locationManager = CLLocationManager()
    ///标记请求是否仍然在进行
    fileprivate var startedLoadingPOIs = false
    /// places 属性用于存储收到的 POI
    fileprivate var places = [Place]()
    
    fileprivate var arViewController:
    
    @IBOutlet weak var cameraButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    
    @IBAction func mapViewAction(_ sender: Any) {
    }
    

}

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            guard let location = locations.last else { return }
            if location.horizontalAccuracy < 100{
                manager.stopUpdatingLocation()
                let span = MKCoordinateSpan(latitudeDelta: 0.014, longitudeDelta: 0.014)
                let region = MKCoordinateRegion(center: location.coordinate, span: span)
                mapView.region = region
                if !startedLoadingPOIs{
                    startedLoadingPOIs = true
                    let loader = PlacesLoader()
                    /// 当前用户位置半径 1000 米范围内的 POI
                    loader.loadPOIS(location: location, radius: 1000) { (result) in
                        
                        for i in 0..<10{
                            let location = CLLocationCoordinate2D(latitude: 0.012, longitude: 122.0 + Double(i))
                            let annotation = PlaceAnnotation(location: location, title: "测试")
                            DispatchQueue.main.async {
                                self.mapView.addAnnotation(annotation)
                            }
                        }
                        
                        
                    }
                }
            }
            
        }
    }
}

