//
//  PlaceAnnotation.swift
//  ARDemo-基于位置定位
//
//  Created by 陈江林 on 2019/11/11.
//  Copyright © 2019 陈江林. All rights reserved.
//

import UIKit
import MapKit
class PlaceAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    init(location: CLLocationCoordinate2D, title: String) {
        self.coordinate = location
        self.title = title
        super.init()
    }
}
