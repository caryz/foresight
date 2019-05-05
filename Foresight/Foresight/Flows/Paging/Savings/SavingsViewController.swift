//
//  SavingsViewController.swift
//  Foresight
//
//  Created by Cary Zhou on 5/4/19.
//  Copyright © 2019 Many Hats. All rights reserved.
//

import UIKit

class SavingsViewController: UIViewController {

    @IBOutlet weak var something: UILabel!
    class func create() -> SavingsViewController {
        let storyboard = UIStoryboard(name: "DashboardFlow", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: Constants.Controllers.savings.rawValue) as! SavingsViewController
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

extension SavingsViewController {
    @objc func didSelectItem(_ notification: NSNotification) {
        guard let item = notification.userInfo?["item"] as? String else { return }
        print("Breakdown selected \(item)")
        something.text = item
    }
}
