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
    var spinnerVC: SpinnerViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        spinnerVC = SpinnerViewController.createSpinnerView(on: self)
        pieChart.delegate = self
        pieChart.noDataText = "Hold your horses 🐎!\nI'm loading..."
        pieChart.noDataFont = Fonts.regular(size: 18)
        pieChart.backgroundColor = Constants.Colors.lightGray
        view.backgroundColor = Constants.Colors.lightGray
        pieChart.noDataTextAlignment = .center
        viewModel = DashboardViewModel(delegate: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        IncidentAPI.getIncidentsByState(state: APIManager.shared.stateAbbrev) { (response: IncidentResponse?) in
            guard let response = response else { return }
            ChartBuilder.buildPieChart(self.pieChart, using: response)
        }
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

// MARK: - DashboardDelegate
extension DashboardViewController: DashboardDelegate {
    func didFinishFetchingIncidents(response: IncidentResponse) {
        print(response)
        DispatchQueue.main.sync {
//            sleep(1)
            spinnerVC.willMove(toParent: nil)
            spinnerVC.view.removeFromSuperview()
            spinnerVC.removeFromParent()
            ChartBuilder.buildPieChart(pieChart, using: response)
        }
    }
}

// MARK: - ChartViewDelegate
extension DashboardViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        guard let pieEntry = entry as? PieChartDataEntry,
            let label = pieEntry.label else { return }

        var item: IncidentType = .severe_storm
        switch label {
        case IncidentType.severe_storm.description: item = .severe_storm
        case IncidentType.flood.description: item = .flood
        case IncidentType.hurricane.description: item = .hurricane
        case IncidentType.snow.description: item = .snow
        case IncidentType.fire.description: item = .fire
        case IncidentType.severe_ice_storm.description: item = .severe_ice_storm
        case IncidentType.tornado.description: item = .tornado
        case IncidentType.drought.description: item = .drought
        default: ()
        }

        viewModel.notifyPieChartSelection(item: item)
    }

    func chartValueNothingSelected(_ chartView: ChartViewBase) {
        viewModel.notifyPieChartDeselection()
    }
}

