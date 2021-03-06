//
//  Constants.swift
//  Foresight
//
//  Created by Cary Zhou on 5/4/19.
//  Copyright © 2019 Many Hats. All rights reserved.
//

import Foundation
import UIKit

class Constants {
    static let googleApiKey = "AIzaSyCHiWYP12kLr8A2wHYX401xASGQuL6aUJ8"
    enum Storyboards {
        static let dashboard = "dashboardNav"
        static let alerts = "alertsNav"
        static let settings = "settingsNav"
    }

    enum Controllers: String {
        case breakdown = "BreakdownViewController"
        case recs = "RecsViewController"
        case savings = "SavingsViewController"
    }

    enum Colors {
        static let lightGray = UIColor(red: 244/255, green: 246/255, blue: 249/255, alpha: 1)
        static let lightBlue = UIColor(red: 69/255, green: 142/255, blue: 242/255, alpha: 1)
    }
}

enum Endpoints {
    static let incidents = "http://jayada.ms/foresight/?incidentsByState"
    static let otherEndpoint = ""
}

class Fonts {
    static func ultraLight(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-UltraLight", size: size)!
    }
    static func light(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Light", size: size)!
    }
    static func regular(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue", size: size)!
    }
    static func bold(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Bold", size: size)!
    }
}

extension Notification.Name {
    static let pieChartSelected = Notification.Name("PieChartSelectedEvent")
    static let pieChartDeselected = Notification.Name("PieChartNothingSelected")
}

struct RecommendationInfo {
    static let details: [String : String] = [
        "Policy Effectivity" : "30 days",
        "Annual Plan" : "Yes",
        "Minimum Coverage" : "Not Started",
        "Maximum Coverage" : "Not Started",
        "Sample Policy" : "None",
        "Privacy  Policy" : "Yes",
    ]

    static let coverage: [String : String] = [
        "Personal Injury" : "Yes",
        "Cars" : "Yes",
        "Appliance" : "Yes",
        "Furniture" : "Not Started",
        "Electrical and Plumbing System" : "None",
        "Personal Belongings" : "Yes",
        "Floor Coverage" : "Yes",
        "Debris Removed" : "Yes",
        "Currency and Valuable Papers" : "No",
        "Non-flammable insulation" : "Yes",
        "Commercial" : "Yes",
        "Residential" : "Yes",
    ]
}
