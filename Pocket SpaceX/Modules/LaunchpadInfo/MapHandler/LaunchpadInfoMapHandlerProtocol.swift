//
//  LaunchpadInfoMapHandlerProtocol.swift
//  Pocket SpaceX
//
//  Created by Антон on 29.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import MapKit

protocol LaunchpadInfoMapHandlerProtocol {
    func attach(_ mapView: MKMapView)
    func setData(_ data: LaunchpadDatum)
}
