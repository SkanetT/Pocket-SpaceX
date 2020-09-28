//
//  LaunchpadInfoMapHandler.swift
//  Pocket SpaceX
//
//  Created by Антон on 29.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import MapKit

class LaunchpadInfoMapHandler: NSObject, LaunchpadInfoMapHandlerProtocol {
    
    private weak var mapView: MKMapView?
    
    func attach(_ mapView: MKMapView) {
        self.mapView = mapView
        mapView.mapType = .standard
    }
    
    func setData(_ data: LaunchpadDatum) {
        guard let mapView = self.mapView else { return }
        DispatchQueue.main.async {
            
            let annotation = MKPointAnnotation()
            let coordinate = CLLocationCoordinate2D(latitude: data.latitude, longitude: data.longitude)
            annotation.coordinate = coordinate
            mapView.addAnnotation(annotation)
            mapView.setCenter(coordinate, animated: false)
            let viewRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 3000, longitudinalMeters: 3000)
            mapView.setRegion(viewRegion, animated: false)
            mapView.isUserInteractionEnabled = false
        }
    }
    
    
    
    
}
