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
    var monthData: [Month]

    var totalClaimCount: Double
    var totalClaimPayout: Double
    var totalPayoutLabel: String
    var avgClaimPayout: String
    var avgClaimsPerYear: String
    var avgPayoutPerYear: String

    var incidentRiskLevel: String

    enum CodingKeys: String, CodingKey {
        case stateAbbrev = "state_abbrev"
        case stateName = "state_name"
        case incidents = "incident_counts"
        case incidentsTotal = "incident_count_total"
        case percentNational = "percentage_of_national"
        case monthData = "month_aggs"

        case totalClaimCount = "total_claim_count"
        case totalClaimPayout = "total_claim_payout"
        case totalPayoutLabel = "total_payout_label"
        case avgClaimPayout = "avgClaimPayout"
        case avgClaimsPerYear = "avgClaimsPerYear"
        case avgPayoutPerYear = "avgPayoutPerYear"
        case incidentRiskLevel
    }
}

struct Incident: Codable {
    var type: IncidentType
    var count: Int
    var percent: Double

    enum CodingKeys: String, CodingKey {
        case type
        case count
        case percent = "percentage_of_all_incidents"
    }
}

struct Month: Codable {
    var month: Double
    var count: Double
    var percentage: Double
}

enum IncidentType: String, Codable, CustomStringConvertible {
    case severe_storm
    case flood
    case hurricane
    case snow
    case fire
    case severe_ice_storm
    case tornado
    case drought

    var description: String {
        switch self {
        case .severe_storm: return "Severe Storm ⛈"
        case .flood: return "Flood 🌊"
        case .hurricane: return "Hurricane 🌧"
        case .snow: return "Snow ❄️"
        case .fire: return "Fire 🔥"
        case .severe_ice_storm: return "Severe Ice Storm 🥶"
        case .tornado: return "Tornado 🌪"
        case .drought: return "Drought 🌵"
        }
    }
}

protocol APICallable {
    static var key: String { get set }
}


class IncidentAPI: APICallable {
    static var key = String(describing: IncidentAPI.self)

    static func getIncidentsByState(completion: ((IncidentResponse?) -> Void)?) {
        guard let request = APIManager.shared
            .makeUrlRequest(endpoint: Endpoints.incidents,
                            queryParams: ["state_abbrev" : "FL"]) else {
                                            completion?(nil)
                                            return
        }

        APIManager.shared.makeApiCall(url: request) { (data) in
            guard let data = data else { return }
            let result = try! JSONDecoder().decode(IncidentResponse.self, from: data)
            APIManager.shared.cache.updateValue(result, forKey: key)
            completion?(result)
        }

    }
}
