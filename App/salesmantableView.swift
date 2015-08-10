//
//  secondView.swift
//  App
//
//  Created by 赵希帆 on 15/4/20.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class salesmantableView : UITableViewController,UIAlertViewDelegate {
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
        while num < count33{
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
        return count33
    }
    //  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
    //  }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("item11", forIndexPath: indexPath) as salesmantablecell
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
        var params : Dictionary<String,String> = ["salesman" : name , "id" : id ]
        
        manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/find2", parameters: params, success: { (operation: AFHTTPRequestOperation!,
            responseObject: AnyObject!) in
            
            var back = responseObject as NSMutableArray!
            
            let view1 = self.storyboard?.instantiateViewControllerWithIdentifier("salesmantable2") as salesmantable2
            view1.navigationItem.title = "评估表：\(self.arr[indexPath.row])"
            //liebiao2 = back.objectAtIndex(0) as NSDictionary
            salesman2[0] = back.objectAtIndex(0)["firstnum"] as NSString
            salesman2[1] = back.objectAtIndex(0)["yearmonth"] as NSString
            salesman2[2] = back.objectAtIndex(0)["contact"] as NSString
            salesman2[3] = back.objectAtIndex(0)["contactphone"] as NSString
            salesman2[4] = back.objectAtIndex(0)["firstunit"] as NSString
            salesman2[5] = back.objectAtIndex(0)["secondunit"] as NSString
            salesman2[6] = back.objectAtIndex(0)["thirdunit"] as NSString
            salesman2[7] = back.objectAtIndex(0)["appraiser"] as NSString
            salesman2[8] = back.objectAtIndex(0)["belong"] as NSString
            salesman2[9] = back.objectAtIndex(0)["local"] as NSString
            salesman2[10] = back.objectAtIndex(0)["firstremark"] as NSString
            salesman2[11] = back.objectAtIndex(0)["areaname"] as NSString
            salesman2[12] = back.objectAtIndex(0)["realdate"] as NSString
            salesman2[13] = back.objectAtIndex(0)["total"] as NSString
            salesman2[14] = back.objectAtIndex(0)["firstevaluate"] as NSString
            salesman2[15] = back.objectAtIndex(0)["firstsuggestion"] as NSString
            salesman2[16] = back.objectAtIndex(0)["secondevaluate"] as NSString
            salesman2[17] = back.objectAtIndex(0)["secondsuggestion"] as NSString
            salesman2[18] = back.objectAtIndex(0)["reportnum"] as NSString
            salesman2[19] = back.objectAtIndex(0)["reportdate"] as NSString
            salesman2[20] = back.objectAtIndex(0)["reportstyle"] as NSString
            salesman2[21] = back.objectAtIndex(0)["pay"] as NSString
            deliverwho = back.objectAtIndex(0)["deliver"] as NSString
            deliverwhoid = back.objectAtIndex(0)["id"] as NSString
            self.navigationController?.pushViewController(view1, animated: true)
            },
            failure: { (operation: AFHTTPRequestOperation!,
                error: NSError!) in
                //Handle Error
                println(error)
                println(operation.responseString)
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
