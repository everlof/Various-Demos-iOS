//
//  AutoResizingMasksChildViewController.swift
//  VariousDemos
//
//  Created by David Everlöf on 29/05/16.
//  Copyright © 2016 The Yelllow Ampersand. All rights reserved.
//

import UIKit

class AutoResizingMasksChildViewController: UIViewController {
    
    var index = 0
    
    var sampleView = UIView()
    
    var sampleLabel = UILabel()
    var resizing: UIViewAutoresizing!
    
    var descLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Main view */
        view.backgroundColor = UIColor.lightGrayColor()
        
        /* Describes this specific autoResizingMask */
        descLabel.font = UIFont.systemFontOfSize(16.0)
        descLabel.textAlignment = .Center
        descLabel.numberOfLines = 0
        
        /* Lable, contained in sample view */
        sampleLabel.text = "Foo, Bar"
        sampleLabel.sizeToFit()
        sampleLabel.backgroundColor = UIColor.yellowColor().colorWithAlphaComponent(0.5)
        sampleLabel.autoresizingMask = resizing // [ .FlexibleWidth, .FlexibleHeight ]
        
        /* Sample view, animates */
        sampleView.backgroundColor = UIColor.redColor()
        sampleView.addSubview(sampleLabel)
        
        view.addSubview(sampleView)
        view.addSubview(descLabel)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animateKeyframesWithDuration(2, delay: 0, options: [ .Autoreverse, .Repeat ], animations: {
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.5, animations: {
                self.sampleView.transform = CGAffineTransformMakeScale(0.25, 0.25)
            })
            UIView.addKeyframeWithRelativeStartTime(0.5, relativeDuration: 0.5, animations: {
                self.sampleView.transform = CGAffineTransformIdentity
            })
            }, completion: nil)
        
    }
    
    override func viewDidLayoutSubviews() {
        sampleView.frame = CGRectMake(0, 0, 200, 200)
        sampleView.center = self.view.center
        descLabel.sizeToFit()
        descLabel.frame = CGRectMake(0, 0, view.frame.size.width, descLabel.frame.size.height)
    }
    
}

