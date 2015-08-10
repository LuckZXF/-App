//
//  salesmanView.swift
//  App
//
//  Created by 赵希帆 on 15/5/26.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class appraiserView : UITableViewController {
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
        return appraiser.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("item6", forIndexPath: indexPath) as appraisercell
        //cell. .text = appraiser[indexPath.row]
        cell.appraiserlabel.text = appraiser[indexPath.row]
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexpath == nil)
        {
            tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.Checkmark
            indexpath = indexPath
            liebiao1[9] = appraiser[indexPath.row]
            isSave = true
            // cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        if(indexpath != nil && indexpath != indexPath)
        {
            tableView.cellForRowAtIndexPath(indexpath!)?.accessoryType = UITableViewCellAccessoryType.None
            tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.Checkmark
            indexpath = indexPath
            liebiao1[9] = appraiser[indexPath.row]
            isSave = true
        }
    }
}


