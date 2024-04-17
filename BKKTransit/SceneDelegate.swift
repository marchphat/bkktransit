//
//  SceneDelegate.swift
//  BKKTransit
//
//  Created by Nantanat Thongthep on 30/3/2567 BE.
//

import SwiftUI
import CoreLocation

class SceneDelegate: NSObject, UIWindowSceneDelegate, CLLocationManagerDelegate {
    
    var window: UIWindow?
    private let userLocationViewModel = UserLocationViewModel()
    private let stationViewModel = StationViewModel()
    private let locationManager = CLLocationManager()
    private var isDataAdded: Bool = false
    private var monitoredRegions: [CLCircularRegion] = []
    private var previousRegionId: String = ""
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        print("SceneDelegate is connected!")
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.distanceFilter = 500
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed with error: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        let nearbyRegions = getNearbyRegions(for: location)
        updateMonitoredRegions(with: nearbyRegions)
        
        if let insideRegion = nearbyRegions.first(where: { $0.contains(location.coordinate) }) {
            let insideRegionId = insideRegion.identifier
            
            if (previousRegionId != "") && (previousRegionId != insideRegionId) {
                print("User has exited the region with id: \(previousRegionId)")
                
                for user in userLocationViewModel.savedUserStatus {
                    userLocationViewModel.updateData(entity: user,
                                                     stationId: previousRegionId,
                                                     isUserInside: false)
                }
            }
            
            print("User is inside the region with identifier: \(insideRegionId)")
            if isDataAdded == false {
                let userId = UUID()
                userLocationViewModel.addData(userId: userId,
                                              stationId: insideRegionId,
                                              isUserInside: true)
                isDataAdded = true
            } else {
                for user in userLocationViewModel.savedUserStatus {
                    userLocationViewModel.updateData(entity: user,
                                                     stationId: insideRegionId,
                                                     isUserInside: true)
                }
            }
            
            previousRegionId = insideRegionId
        } else {
            print("User has exited the region with identifier: \(previousRegionId)")
            
            for user in userLocationViewModel.savedUserStatus {
                userLocationViewModel.updateData(entity: user,
                                                 stationId: previousRegionId,
                                                 isUserInside: false)
            }
            
            previousRegionId = ""
            print("User is outside all monitored regions.")
        }
        
        
    }
    
    func getNearbyRegions(for location: CLLocation) -> [CLCircularRegion] {
        let nearbyStations = stationViewModel.allStations.filter { station in
            let stationLocation = CLLocation(latitude: station.latitude, longitude: station.longitude)
            let distance = location.distance(from: stationLocation)
            return distance < 500
        }
        
        return nearbyStations.map { station in
            let region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: station.latitude, longitude: station.longitude), radius: 300, identifier: station.stationId ?? "0")
            region.notifyOnEntry = true
            region.notifyOnExit = true
            return region
        }
    }
    
    func updateMonitoredRegions(with nearbyRegions: [CLCircularRegion]) {
        let regionsToStopMonitoring = monitoredRegions.filter { region in
            !nearbyRegions.contains(region)
        }
        for region in regionsToStopMonitoring {
            locationManager.stopMonitoring(for: region)
            if let index = monitoredRegions.firstIndex(of: region) {
                monitoredRegions.remove(at: index)
            }
        }
        
        let regionsToStartMonitoring = nearbyRegions.filter { region in
            !monitoredRegions.contains(region)
        }
        for region in regionsToStartMonitoring {
            locationManager.startMonitoring(for: region)
            monitoredRegions.append(region)
        }
    }
}
