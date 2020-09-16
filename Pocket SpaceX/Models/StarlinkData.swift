//
//  StarlinkData.swift
//  Pocket SpaceX
//
//  Created by Антон on 16.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class StarlinkRequest: BaseRequest<StarlinkData> {
    
    override var path: String {
        return "/v4/starlink"
    }
}

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

//enum Launch: String, Codable {
//    case the5Eb87D14Ffd86E000604B361 = "5eb87d14ffd86e000604b361"
//    case the5Eb87D30Ffd86E000604B378 = "5eb87d30ffd86e000604b378"
//    case the5Eb87D39Ffd86E000604B37D = "5eb87d39ffd86e000604b37d"
//    case the5Eb87D3Cffd86E000604B380 = "5eb87d3cffd86e000604b380"
//    case the5Eb87D3Fffd86E000604B382 = "5eb87d3fffd86e000604b382"
//    case the5Eb87D41Ffd86E000604B383 = "5eb87d41ffd86e000604b383"
//    case the5Eb87D43Ffd86E000604B385 = "5eb87d43ffd86e000604b385"
//    case the5Eb87D44Ffd86E000604B386 = "5eb87d44ffd86e000604b386"
//    case the5Eb87D45Ffd86E000604B387 = "5eb87d45ffd86e000604b387"
//    case the5Eb87D46Ffd86E000604B389 = "5eb87d46ffd86e000604b389"
//    case the5Ed9819A1F30554030D45C29 = "5ed9819a1f30554030d45c29"
//    case the5Ed981D91F30554030D45C2A = "5ed981d91f30554030d45c2a"
//    case the5Ef6A1E90059C33Cee4A828A = "5ef6a1e90059c33cee4a828a"
//}

struct SpaceTrack: Codable {
    let ccsdsOmmVers: String
    let comment: String
    let creationDate: String
    let originator: String
    let objectName, objectID: String
    let centerName: String
    let refFrame: String
    let timeSystem: String
    let meanElementTheory: String
    let epoch: String
    let meanMotion, eccentricity, inclination, raOfAscNode: Double
    let argOfPericenter, meanAnomaly: Double
    let ephemerisType: Int
    let classificationType: String
    let noradCatID, elementSetNo, revAtEpoch: Int
    let bstar, meanMotionDot, meanMotionDdot, semimajorAxis: Double
    let period, apoapsis, periapsis: Double
    let objectType: String
    let rcsSize: String?
    let countryCode: String
    let launchDate: String
    let site: String
    let decayDate: String?
    let decayed, file, gpID: Int
    let tleLine0, tleLine1, tleLine2: String

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

//enum CenterName: String, Codable {
//    case earth = "EARTH"
//}
//
//enum ClassificationType: String, Codable {
//    case u = "U"
//}
//
//enum Comment: String, Codable {
//    case generatedViaSpaceTrackOrgAPI = "GENERATED VIA SPACE-TRACK.ORG API"
//}
//
//enum CountryCode: String, Codable {
//    case us = "US"
//}
//
//enum MeanElementTheory: String, Codable {
//    case sgp4 = "SGP4"
//}
//
//enum ObjectType: String, Codable {
//    case payload = "PAYLOAD"
//}
//
//enum Originator: String, Codable {
//    case the18Spcs = "18 SPCS"
//}
//
//enum RCSSize: String, Codable {
//    case large = "LARGE"
//    case medium = "MEDIUM"
//}
//
//enum RefFrame: String, Codable {
//    case teme = "TEME"
//}
//
//enum Site: String, Codable {
//    case afetr = "AFETR"
//    case afwtr = "AFWTR"
//}
//
//enum TimeSystem: String, Codable {
//    case utc = "UTC"
//}
//
//enum Version: String, Codable {
//    case prototype = "prototype"
//    case v09 = "v0.9"
//    case v10 = "v1.0"
//}
//
