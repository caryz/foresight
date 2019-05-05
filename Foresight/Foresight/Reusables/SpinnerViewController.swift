//
//  SpinnerViewController.swift
//  Foresight
//
//  Created by Cary Zhou on 5/5/19.
//  Copyright © 2019 Many Hats. All rights reserved.
//

import UIKit

class SpinnerViewController: UIViewController {
    var spinner = UIActivityIndicatorView(style: .whiteLarge)

    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)

        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    static func createSpinnerView(on viewController: UIViewController) -> SpinnerViewController{
        let child = SpinnerViewController()

        // add the spinner view controller
        viewController.addChild(child)
        child.view.frame = viewController.view.frame
        viewController.view.addSubview(child.view)
        child.didMove(toParent: viewController)
        return child
    }
}
