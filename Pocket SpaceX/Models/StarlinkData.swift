//
//  StarlinkData.swift
//  Pocket SpaceX
//
//  Created by Антон on 16.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

typealias StarlinkData = [StarlinkDatum]

struct StarlinkDatum: Codable {
    let spaceTrack: SpaceTrack
    let version: String
    let launch: String
    let longitude, latitude, heightKM, velocityKms: Double?
    let id: String

    enum CodingKeys: String, CodingKey {
        case spaceTrack, version, launch, longitude, latitude
        case heightKM = "height_km"
        case velocityKms = "velocity_kms"
        case id
    }
}


struct SpaceTrack: Codable {
    let ccsdsOmmVers: String?
    let comment: String?
    let creationDate: String?
    let originator: String?
    let objectName, objectID: String
    let centerName: String?
    let refFrame: String?
    let timeSystem: String?
    let meanElementTheory: String?
    let epoch: String?
    let meanMotion, eccentricity, inclination, raOfAscNode: Double?
    let argOfPericenter, meanAnomaly: Double?
    let ephemerisType: Int?
    let classificationType: String?
    let noradCatID, elementSetNo, revAtEpoch: Int?
    let bstar, meanMotionDot, meanMotionDdot, semimajorAxis: Double?
    let period, apoapsis, periapsis: Double?
    let objectType: String?
    let rcsSize: String?
    let countryCode: String?
    let launchDate: String
    let site: String?
    let decayDate: String?
    let decayed, file, gpID: Int?
    let tleLine0, tleLine1, tleLine2: String?

    enum CodingKeys: String, CodingKey {
        case ccsdsOmmVers = "CCSDS_OMM_VERS"
        case comment = "COMMENT"
        case creationDate = "CREATION_DATE"
        case originator = "ORIGINATOR"
        case objectName = "OBJECT_NAME"
        case objectID = "OBJECT_ID"
        case centerName = "CENTER_NAME"
        case refFrame = "REF_FRAME"
        case timeSystem = "TIME_SYSTEM"
        case meanElementTheory = "MEAN_ELEMENT_THEORY"
        case epoch = "EPOCH"
        case meanMotion = "MEAN_MOTION"
        case eccentricity = "ECCENTRICITY"
        case inclination = "INCLINATION"
        case raOfAscNode = "RA_OF_ASC_NODE"
        case argOfPericenter = "ARG_OF_PERICENTER"
        case meanAnomaly = "MEAN_ANOMALY"
        case ephemerisType = "EPHEMERIS_TYPE"
        case classificationType = "CLASSIFICATION_TYPE"
        case noradCatID = "NORAD_CAT_ID"
        case elementSetNo = "ELEMENT_SET_NO"
        case revAtEpoch = "REV_AT_EPOCH"
        case bstar = "BSTAR"
        case meanMotionDot = "MEAN_MOTION_DOT"
        case meanMotionDdot = "MEAN_MOTION_DDOT"
        case semimajorAxis = "SEMIMAJOR_AXIS"
        case period = "PERIOD"
        case apoapsis = "APOAPSIS"
        case periapsis = "PERIAPSIS"
        case objectType = "OBJECT_TYPE"
        case rcsSize = "RCS_SIZE"
        case countryCode = "COUNTRY_CODE"
        case launchDate = "LAUNCH_DATE"
        case site = "SITE"
        case decayDate = "DECAY_DATE"
        case decayed = "DECAYED"
        case file = "FILE"
        case gpID = "GP_ID"
        case tleLine0 = "TLE_LINE0"
        case tleLine1 = "TLE_LINE1"
        case tleLine2 = "TLE_LINE2"
    }
}
