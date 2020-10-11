//
//  LaunchpadRequest.swift
//  Pocket SpaceX
//
//  Created by Антон on 11.10.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

final class LaunchpadRequest: BaseRequest<LaunchpadData> {
    
    override var path: String {
        return "/v4/launchpads"
    }
}
