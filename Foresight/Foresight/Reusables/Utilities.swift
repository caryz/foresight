//
//  Utilities.swift
//  Foresight
//
//  Created by Cary Zhou on 5/4/19.
//  Copyright © 2019 Many Hats. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func loadFromNib(_ name: String) -> UIViewController {
        return UIViewController(nibName: name, bundle: nil)
    }
}
