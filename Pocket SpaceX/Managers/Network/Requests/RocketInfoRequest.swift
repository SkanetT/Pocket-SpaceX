//
//  RocketInfoRequest.swift
//  Pocket SpaceX
//
//  Created by Антон on 11.10.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

final class RocketInfoRequest: BaseRequest<RocketDatum> {
    
    let id: String
    
    init(id: String) {
        self.id = id
    }
    
    override var path: String {
        return "/v4/rockets/\(id)"
    }
}
