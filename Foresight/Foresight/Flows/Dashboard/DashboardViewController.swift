//
//  DashboardViewController.swift
//  Foresight
//
//  Created by Cary Zhou on 5/4/19.
//  Copyright © 2019 Many Hats. All rights reserved.
//

import UIKit
import Charts

class DashboardViewController: UIViewController {

    // Outlets
    @IBOutlet weak var pieChart: PieChartView!

    // ivars
    var viewModel: DashboardViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        pieChart.delegate = self
        viewModel = DashboardViewModel(delegate: self)

        PieChartBuilder.build(using: pieChart)
    }

}

extension DashboardViewController: DashboardDelegate {
    func didFinishFetch(response: String) {
        print(response)
    }
}

// MARK: - ChartViewDelegate
extension DashboardViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        guard let pieEntry = entry as? PieChartDataEntry,
            let label = pieEntry.label else { return }
        print("Selected: \(label)")
    }
}
