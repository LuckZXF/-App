//
//  secondevaluateView.swift
//  App
//
//  Created by 赵希帆 on 15/5/30.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class reportstypeView : UITableViewController {
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
        return reportstype.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("item9", forIndexPath: indexPath) as reportstypecell
        //cell. .text = appraiser[indexPath.row]
        cell.firstlabel.text = reportstype[indexPath.row]
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexpath == nil)
        {
            tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.Checkmark
            indexpath = indexPath
            if(shenfen == 1)
            {
            liebiao1[23] = reportstype[indexPath.row]
            }
            else if(shenfen == 5)
            {
                money2[17] = reportstype[indexPath.row]
            }
            else if (shenfen == 6)
            {
                writing2[14] = reportstype[indexPath.row]
            }
            isSave = true
            // cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        if(indexpath != nil && indexpath != indexPath)
        {
            tableView.cellForRowAtIndexPath(indexpath!)?.accessoryType = UITableViewCellAccessoryType.None
            tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.Checkmark
            indexpath = indexPath
            if(shenfen == 1)
            {
            liebiao1[23] = reportstype[indexPath.row]
            }
            else if(shenfen == 5)
            {
                money2[17] = reportstype[indexPath.row]
            }
            else if(shenfen == 6)
            {
                writing2[14] = reportstype[indexPath.row]
            }
            isSave = true
        }
    }
}





