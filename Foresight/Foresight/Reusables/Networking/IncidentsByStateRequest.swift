//
//  IncidentsByStateRequest.swift
//  Foresight
//
//  Created by Cary Zhou on 5/4/19.
//  Copyright © 2019 Many Hats. All rights reserved.
//

import Foundation

struct IncidentResponse: Codable {
    var stateAbbrev: String
    var stateName: String
    var incidents: [Incident]
    var incidentsTotal: Int
    var percentNational: Double

    enum CodingKeys: String, CodingKey {
        case stateAbbrev = "state_abbrev"
        case stateName = "state_name"
        case incidents = "incident_counts"
        case incidentsTotal = "incident_count_total"
        case percentNational = "percentage_of_national"
    }
}

struct Incident: Codable {
    var type: IncidentType
    var count: Int
    var percentage_of_all_incidents: Double
}

enum IncidentType: String, Codable {
    case severe_storm
    case flood
    case hurricane
    case snow
    case fire
    case severe_ice_storm
    case tornado
    case drought
}

class IncidentAPI {
    static func getIncidentsByState(completion: ((IncidentResponse) -> Void)?) {
        let url = Bundle.main.url(forResource: "test", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let res = try! JSONDecoder().decode(IncidentResponse.self, from: data)
//        print(ha)
        completion?(res)
    }
}
