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
        return [BreakdownViewController.create(),
                RecsViewController.create(),
                SavingsViewController.create()]
    }()

    var pageControl: UIPageControl!
    var currentViewController: UIViewController = UIViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self

        if let firstVC = pages.first {
            let _ = firstVC.view
            setViewControllers([firstVC], direction: .forward, animated: true)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        pageControl == nil ? setupPageControl() : ()
    }

    private func setupPageControl() {
        let width: CGFloat = 60
        let height: CGFloat = 20
        let xPos: CGFloat = view.center.x - width / 2
        let yPos: CGFloat = view.frame.height - height - 10
        pageControl = UIPageControl(frame: CGRect(x: xPos,
                                                  y: yPos,
                                                  width: width,
                                                  height: height))
        pageControl.backgroundColor = .lightGray
        pageControl.layer.cornerRadius = height / 2
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.alpha = 0.5
        pageControl.tintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.black
        view.addSubview(pageControl)
    }
}

extension PagingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController) else { return nil }
        if index - 1 >= 0 {
            currentViewController = pages[index-1]
            return currentViewController
        }
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController) else { return nil }
        if index + 1 < pages.count {
            currentViewController = pages[index+1]
            return currentViewController
        }
        return nil
    }
}

extension PagingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = pages.firstIndex(of: pageContentViewController)!
    }
}
