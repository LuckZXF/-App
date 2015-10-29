//
//  secondevaluateView.swift
//  App
//
//  Created by 赵希帆 on 15/5/30.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class secondevaluateView : UITableViewController {
    var indexpath : NSIndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //返回节的个数
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        //  println(count)
        return secondvaluate.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("item8", forIndexPath: indexPath) as! secondevaluatecell
        //cell. .text = appraiser[indexPath.row]
        cell.firstlabel.text = secondvaluate[indexPath.row]
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexpath == nil)
        {
            tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.Checkmark
            indexpath = indexPath
            liebiao1[19] = secondvaluate[indexPath.row]
            isSave = true
            // cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        if(indexpath != nil && indexpath != indexPath)
        {
            tableView.cellForRowAtIndexPath(indexpath!)?.accessoryType = UITableViewCellAccessoryType.None
            tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.Checkmark
            indexpath = indexPath
            liebiao1[19] = secondvaluate[indexPath.row]
            isSave = true
        }
    }
}





