//
//  ViewController.swift
//  VariousDemos
//
//  Created by David Everlöf on 29/05/16.
//  Copyright © 2016 The Yelllow Ampersand. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    struct DemoItem {
        var name: String
        var controller: AnyObject?
    }
    
    var demoHierarchy: [DemoItem] = [
        DemoItem(name: "AutoResizingMasks", controller: AutoResizingMasksViewController())
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        demoHierarchy = demoHierarchy.sort({
            $0.name.compare($1.name) == .OrderedAscending
        })
        
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoHierarchy.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reusableIdentifier = "TheCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(reusableIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: reusableIdentifier)
        }
        
        let demoItem = demoHierarchy[indexPath.row]
        
        cell?.textLabel?.text = demoItem.name
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let demoItem = demoHierarchy[indexPath.row]
        ((demoItem.controller) as! UIViewController).title = demoItem.name
        
        self.navigationController?.pushViewController((demoItem.controller as! UIViewController), animated: true)
    }
    
}

