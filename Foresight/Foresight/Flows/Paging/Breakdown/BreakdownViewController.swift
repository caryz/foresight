//
//  BreakdownViewController.swift
//  Foresight
//
//  Created by Cary Zhou on 5/4/19.
//  Copyright © 2019 Many Hats. All rights reserved.
//

import UIKit

class BreakdownViewController: UIViewController {

    class func create() -> BreakdownViewController {
        let storyboard = UIStoryboard(name: "DashboardFlow", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: Constants.Controllers.breakdown.rawValue) as! BreakdownViewController
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didSelectItem(_:)),
                                               name: .pieChartSelected,
                                               object: nil)
    }


}

extension BreakdownViewController {
    @objc func didSelectItem(_ notification: NSNotification) {
        guard let item = notification.userInfo?["Object"] as? String else { return }
        print("Breakdown selected \(item)")
    }
}
