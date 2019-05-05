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
        static let lightGray = UIColor(red: 244/255, green: 246/255, blue: 249/255, alpha: 1)
        static let lightBlue = UIColor(red: 69/255, green: 142/255, blue: 242/255, alpha: 1)
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
    static let pieChartDeselected = Notification.Name("PieChartNothingSelected")
}

