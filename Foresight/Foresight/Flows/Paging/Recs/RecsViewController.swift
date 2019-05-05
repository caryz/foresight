//
//  RecsViewController.swift
//  Foresight
//
//  Created by Cary Zhou on 5/4/19.
//  Copyright © 2019 Many Hats. All rights reserved.
//

import UIKit
import SafariServices

class RecsViewController: UIViewController {
    @IBOutlet weak var detailsStack: UIStackView!
    @IBOutlet weak var coverageStack: UIStackView!
    @IBOutlet weak var insuranceImage: UIImageView!

    @IBOutlet weak var planDetailsView: PaperTileView!
    @IBOutlet weak var coverageProtectionView: PaperTileView!

    var configured = false

    class func create() -> RecsViewController {
        let storyboard = UIStoryboard(name: "DashboardFlow", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: Constants.Controllers.recs.rawValue) as! RecsViewController
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didSelectItem(_:)),
                                               name: .pieChartSelected,
                                               object: nil)
        navigationController?.tabBarItem.image = UIImage(named: "dashboardIcon")

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configured ? () : configureStacks()
    }

    fileprivate func configureStacks() {
        let superViewWidth = detailsStack.frame.width
        detailsStack.spacing = 12

        for detail in RecommendationInfo.details {
            let leftLabel = UILabel(frame: CGRect(x: 0, y: 5, width: 100, height: 15))
            leftLabel.text = detail.key
//            leftLabel.backgroundColor = .blue
            leftLabel.font = Fonts.light(size: 14)
            let rightLabel = UILabel(frame: CGRect(x: superViewWidth - 100, y: 5, width: 60, height: 15))
            rightLabel.text = detail.value
            rightLabel.textAlignment = .right
//            rightLabel.backgroundColor = .red
            rightLabel.font = Fonts.regular(size: 14)

            let wrapper = UIStackView(arrangedSubviews: [leftLabel, rightLabel])
            detailsStack.addArrangedSubview(wrapper)
        }

        coverageStack.spacing = 12
        for coverage in RecommendationInfo.coverage {
            let leftLabel = UILabel()
            leftLabel.text = coverage.key
            //            leftLabel.backgroundColor = .blue
            leftLabel.font = Fonts.light(size: 14)
            let rightLabel = UILabel()
            rightLabel.text = coverage.value
            rightLabel.textAlignment = .right
            //            rightLabel.backgroundColor = .red
            rightLabel.font = Fonts.regular(size: 14)

            let wrapper = UIStackView(arrangedSubviews: [leftLabel, rightLabel])
            coverageStack.addArrangedSubview(wrapper)
        }

        configured = true
    }

    @IBAction func didTapStartButton(_ sender: Any) {
        guard let url = URL(string: "https://www.statefarm.com/insurance#Small-Business") else {
            return
        }

        let safariVC = SFSafariViewController(url: url)
        safariVC.delegate = self

        present(safariVC, animated: true, completion: nil)
    }

}

extension RecsViewController {
    @objc func didSelectItem(_ notification: NSNotification) {
        guard let item = notification.userInfo?["item"] as? String else { return }
        print("Breakdown selected \(item)")
    }
}

extension RecsViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true)
    }
}
