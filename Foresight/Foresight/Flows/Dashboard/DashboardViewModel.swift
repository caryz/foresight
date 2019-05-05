//
//  DashboardViewModel.swift
//  Foresight
//
//  Created by Cary Zhou on 5/4/19.
//  Copyright © 2019 Many Hats. All rights reserved.
//

import Foundation

protocol DashboardDelegate: class {
    func didFinishFetchingIncidents(response: IncidentResponse)
}

class DashboardViewModel {

    weak var delegate: DashboardDelegate?

    convenience init(delegate: DashboardDelegate) {
        self.init()
        self.delegate = delegate
        makeApiCalls()
    }

    func makeApiCalls() {
        IncidentAPI.getIncidentsByState(state: APIManager.shared.stateAbbrev) { [weak self] (response: IncidentResponse?) in
            guard let strongSelf = self,
                let response = response else { return }
            strongSelf.delegate?.didFinishFetchingIncidents(response: response)
        }
    }

    func notifyPieChartSelection(item: IncidentType) {
        DispatchQueue.main.async {
        NotificationCenter.default.post(name: .pieChartSelected,
                                        object: nil,
                                        userInfo: ["item": item])

        print(item.description)
        }
    }

    func notifyPieChartDeselection() {
        NotificationCenter.default.post(name: .pieChartDeselected,
                                        object: nil,
                                        userInfo: nil)
    }
}
