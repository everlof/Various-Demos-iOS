//
//  AutoResizingMasksViewController.swift
//  VariousDemos
//
//  Created by David Everlöf on 29/05/16.
//  Copyright © 2016 The Yelllow Ampersand. All rights reserved.
//

import UIKit

struct AutoResizeSample {
    var mode: UIViewAutoresizing
    var desc: String
}

class AutoResizingMasksViewController: UIViewController,
    UIPageViewControllerDataSource
{
    let examples: [AutoResizeSample] = [
        AutoResizeSample(mode: [], desc: "[]"),
        
        AutoResizeSample(mode: [
                                .FlexibleLeftMargin,
                                .FlexibleRightMargin,
                                .FlexibleTopMargin,
                                .FlexibleBottomMargin,
                                .FlexibleHeight,
                                .FlexibleWidth],
                         desc: "[ .FlexibleLeftMargin, .FlexibleRightMargin, .FlexibleTopMargin, .FlexibleBottomMargin, .FlexibleHeight, .FlexibleWidth ]"),
        
        AutoResizeSample(mode: [ .FlexibleWidth ],
                         desc: "[ .FlexibleWidth ]"),
        
        AutoResizeSample(mode: [ .FlexibleHeight ],
                         desc: "[ .FlexibleHeight ]"),
        
        AutoResizeSample(mode: [
                                .FlexibleWidth,
                                .FlexibleHeight ],
                         desc: "[ .FlexibleWidth, .FlexibleHeight ]"),
        
        AutoResizeSample(mode: [ .FlexibleBottomMargin ],
                         desc: "[ .[ .FlexibleBottomMargin ] ]"),
        
        AutoResizeSample(mode: [
                                .FlexibleBottomMargin,
                                .FlexibleTopMargin ],
                        desc: "[ .FlexibleBottomMargin, .FlexibleTopMargin ]")
    ]
    
    var pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: [:])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGrayColor()
        
        pageViewController.dataSource = self
        pageViewController.view.frame =
            /* Offset it abit down so it doesnt go under the navbar */
            CGRectMake(0, 84, self.view.frame.size.width, self.view.frame.size.height - 84)
        
        pageViewController.view.backgroundColor = UIColor.lightGrayColor()
        
        
        let initialVC: AutoResizingMasksChildViewController = self.viewControllerAtIndex(0) as! AutoResizingMasksChildViewController
        
        pageViewController.setViewControllers([initialVC], direction: .Forward, animated: false, completion: nil)
        
        self.addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func viewControllerAtIndex(index: Int) -> UIViewController {
        
        let sample = examples[index]
        let vc = AutoResizingMasksChildViewController()
        
        vc.index = index
        vc.descLabel.text = "label.autoresizingMask = \(sample.desc)"
        vc.resizing = sample.mode
        
        return vc
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! AutoResizingMasksChildViewController).index
        
        if index == 0 {
            return nil
        }
        
        index -= 1
        
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! AutoResizingMasksChildViewController).index
        
        if index == examples.count - 1 {
            return nil
        }
        
        index += 1
        
        return self.viewControllerAtIndex(index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return examples.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}