//
//  PagingViewController.swift
//  Foresight
//
//  Created by Cary Zhou on 5/4/19.
//  Copyright © 2019 Many Hats. All rights reserved.
//

import UIKit

class PagingViewController: UIPageViewController {
    fileprivate lazy var pages: [UIViewController] = {
        return [loadFromNib(Constants.Controllers.breakdown.rawValue),
                loadFromNib(Constants.Controllers.recs.rawValue),
                loadFromNib(Constants.Controllers.savings.rawValue)]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        setUpPageViewController()
        setupPageControl()

        if let firstVC = pages.first {
            setViewControllers([firstVC], direction: .forward, animated: true)
        }
    }

    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = .lightGray
        appearance.currentPageIndicatorTintColor = .darkGray
        appearance.backgroundColor = .white
    }

    private func setUpPageViewController() {
        // nothing here yet
    }
}

extension PagingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController) else { return nil }
        return index - 1 < 0 ? nil : pages[index - 1]
//        let previousIndex = index - 1
//        guard previousIndex >= 0 else { return pages.last }
//        guard pages.count > previousIndex else { return nil }
//        return pages[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController) else { return nil }
        return index + 1 >= pages.count ? nil : pages[index + 1]
//        let nextIndex = index + 1
//        guard nextIndex < pages.count else { return pages.first }
//        guard pages.count > nextIndex else { return nil }
//        return pages[nextIndex]
    }
}

extension PagingViewController: UIPageViewControllerDelegate {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.pages.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
