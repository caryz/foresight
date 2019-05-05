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
        ChartBuilder.buildPieChart(pieChart)
    }


}

// MARK: - DashboardDelegate
extension DashboardViewController: DashboardDelegate {
    func didFinishFetchingIncidents(response: IncidentResponse) {
        print(response)
    }
}

// MARK: - ChartViewDelegate
extension DashboardViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        guard let pieEntry = entry as? PieChartDataEntry,
            let label = pieEntry.label else { return }
        print("Selected: \(label)")

        NotificationCenter.default.post(name: .pieChartSelected,
                                        object: nil,
                                        userInfo: ["item": label])
    }

    func chartValueNothingSelected(_ chartView: ChartViewBase) {
        NotificationCenter.default.post(name: .pieChartDeselected,
                                        object: nil,
                                        userInfo: nil)
    }
}
