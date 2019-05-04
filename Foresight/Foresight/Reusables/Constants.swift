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

    }
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
}

