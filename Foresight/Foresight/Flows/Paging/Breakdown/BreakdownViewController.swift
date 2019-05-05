//
//  BreakdownViewController.swift
//  Foresight
//
//  Created by Cary Zhou on 5/4/19.
//  Copyright © 2019 Many Hats. All rights reserved.
//

import UIKit
import Charts

class BreakdownViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var infoView: PaperTileView!
    @IBOutlet weak var chartView: PaperTileView!
    @IBOutlet weak var barChart: BarChartView!

    // Info View
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var annualDamageTitle: UILabel!
    @IBOutlet weak var annualDamageValue: UILabel!
    @IBOutlet weak var avgClaimTitle: UILabel!
    @IBOutlet weak var avgClaimValue: UILabel!
    @IBOutlet weak var avgDisasterCountTitle: UILabel!
    @IBOutlet weak var avgDisasterCountValue: UILabel!

    class func create() -> BreakdownViewController {
        let storyboard = UIStoryboard(name: "DashboardFlow", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: Constants.Controllers.breakdown.rawValue) as! BreakdownViewController
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        APIManager.shared.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(didSelectItem(_:)), name: .pieChartSelected, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didUnselectItems(_:)), name: .pieChartDeselected, object: nil)
        infoView.isHidden = true
    }
}

extension BreakdownViewController {
    @objc func didSelectItem(_ notification: NSNotification) {
        guard let item = notification.userInfo?["item"] as? String else { return }
        print("Breakdown selected \(item)")
    }

    @objc func didUnselectItems(_ notification: NSNotification) {
        print("Unselected")
    }
}

extension BreakdownViewController: APIManagerDelegate {
    func didFinishCall() {
        guard let res = APIManager.shared.cache[IncidentAPI.key] as? IncidentResponse else {
            return
        }
        DispatchQueue.main.sync {
            annualDamageValue.text = res.avgPayoutPerYear
            avgClaimValue.text = res.avgClaimsPerYear
            avgDisasterCountValue.text = String(res.incidentsTotal)
            infoView.isHidden = false
            ChartBuilder.buildBarChart(barChart, using: res)
        }
    }
}
