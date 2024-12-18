////
////  LocationDelegate.swift
////  Treasure Trail
////
////  Created by Giorgio Durante on 10/12/24.
////
//
//import CoreLocation
//
//class LocationDelegate: NSObject, ObservableObject, CLLocationManagerDelegate {
//    private let locationManager = CLLocationManager()
//    private var targetLatitude: Double = 0.0
//    private var targetLongitude: Double = 0.0
//    private var onUpdate: ((Bool) -> Void)?
//
//    func startMonitoring(latitude: Double, longitude: Double, onUpdate: @escaping (Bool) -> Void) {
//        self.targetLatitude = latitude
//        self.targetLongitude = longitude
//        self.onUpdate = onUpdate
//
//        locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let currentLocation = locations.last else { return }
//        let targetLocation = CLLocation(latitude: targetLatitude, longitude: targetLongitude)
//        
//        let distance = currentLocation.distance(from: targetLocation)
//        let isNearby = distance <= 10.0 // Distanza di 10 metri
//        onUpdate?(isNearby)
//    }
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("Location update failed: \(error.localizedDescription)")
//    }
//}
