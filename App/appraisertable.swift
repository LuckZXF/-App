//
//  secondView.swift
//  App
//
//  Created by 赵希帆 on 15/4/20.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class appraisertable : UITableViewController,UIAlertViewDelegate {
    var list : [Int] = [2,3]
    var items : NSMutableArray?
    var count : Int = 1
    var num : Int = 0
    var arr : [String] = []
    // var count : Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = NSMutableArray()
        //self.arr = NSArray()
        while num < count44 {
            self.items?.addObject("1")
            
            arr.insert(pinggu[num], atIndex: 0)
            num++
        }
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return count44
    }
    //  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
    //  }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("item13", forIndexPath: indexPath) as! appraisertablecell
        let n : Int = self.items!.count
        cell.label.text = "\(arr[indexPath.row])"
        //  count++
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let manager = AFHTTPRequestOperationManager()
        var zxf : AFJSONRequestSerializer = AFJSONRequestSerializer()
        var fxz : AFJSONResponseSerializer = AFJSONResponseSerializer()
        manager.requestSerializer = zxf
        manager.responseSerializer = fxz
        var name : String = test2!
        deliverid =  "\(arr[indexPath.row])"
        var id : String = "\(arr[indexPath.row])"
        var params : Dictionary<String,String> = ["appraiser" : name , "id" : id ]
        
        manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/find3", parameters: params, success: { (operation: AFHTTPRequestOperation!,
            responseObject: AnyObject!) in
            
            var back = responseObject as! NSMutableArray!
            
            let view1 = self.storyboard?.instantiateViewControllerWithIdentifier("appraisertable2") as! appraisertable2
            view1.navigationItem.title = "评估表：\(self.arr[indexPath.row])"
            //liebiao2 = back.objectAtIndex(0) as NSDictionary
            appraiser2[0] = back.objectAtIndex(0)["firstnum"] as! String
            appraiser2[1] = back.objectAtIndex(0)["yearmonth"] as! String
            appraiser2[2] = back.objectAtIndex(0)["contact"] as! String
            appraiser2[3] = back.objectAtIndex(0)["contactphone"] as! String
            appraiser2[4] = back.objectAtIndex(0)["firstunit"] as! String
            appraiser2[5] = back.objectAtIndex(0)["secondunit"] as! String
            appraiser2[6] = back.objectAtIndex(0)["thirdunit"] as! String
            appraiser2[7] = back.objectAtIndex(0)["appraiser"] as! String
            appraiser2[8] = back.objectAtIndex(0)["belong"] as! String
            appraiser2[9] = back.objectAtIndex(0)["local"] as! String
            appraiser2[10] = back.objectAtIndex(0)["firstremark"] as! String
            appraiser2[11] = back.objectAtIndex(0)["areaname"] as! String
            appraiser2[12] = back.objectAtIndex(0)["realdate"] as! String
            appraiser2[13] = back.objectAtIndex(0)["outtime"] as! String
            appraiser2[14] = back.objectAtIndex(0)["total"] as! String
            appraiser2[15] = back.objectAtIndex(0)["firstevaluate"] as! String
            appraiser2[16] = back.objectAtIndex(0)["firstsuggestion"] as! String
            appraiser2[17] = back.objectAtIndex(0)["secondevaluate"] as! String
            appraiser2[18] = back.objectAtIndex(0)["secondsuggestion"] as! String
            appraiser2[19] = back.objectAtIndex(0)["reportnum"] as! String
            appraiser2[20] = back.objectAtIndex(0)["reportdate"] as! String
            appraiser2[21] = back.objectAtIndex(0)["reportstyle"] as! String
            deliverwho = back.objectAtIndex(0)["deliver"] as! String
            deliverwhoid = back.objectAtIndex(0)["id"] as! String
            self.navigationController?.pushViewController(view1, animated: true)
            },
            failure: { (operation: AFHTTPRequestOperation!,
                error: NSError!) in
                //Handle Error
                print(error)
                print(operation.responseString)
        })
    }
    
    // 支持单元格编辑功能
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    //在编辑状态，可以拖动设置item位置
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    
    
}
