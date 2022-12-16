//
//  LocationManager.swift
//  Weather
//
//  Created by Дмитрий Федотов on 13.12.2022.
//

import CoreLocation

class LocationManager {
    
    var locationAllowed: Bool {
        get {
            let locationManager = CLLocationManager()
            let status = locationManager.authorizationStatus
            if status == .authorizedAlways, status == .authorizedWhenInUse {
                return true
            } else {
                return false
            }
        }
    }
    
    func requestAuthorization() {
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
    }
}
