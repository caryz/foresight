//
//  DashboardViewModel.swift
//  Foresight
//
//  Created by Cary Zhou on 5/4/19.
//  Copyright © 2019 Many Hats. All rights reserved.
//

import Foundation

protocol DashboardDelegate: class {
    func didFinishFetch(response: String)
}

class DashboardViewModel {

    weak var delegate: DashboardDelegate?

    convenience init(delegate: DashboardDelegate) {
        self.init()
        self.delegate = delegate
        self.delegate?.didFinishFetch(response: "api calls finished")
    }


}
