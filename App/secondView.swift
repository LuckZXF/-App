//
//  secondView.swift
//  App
//
//  Created by 赵希帆 on 15/4/20.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class secondView : UITableViewController {
    var list : [Int] = [2,3]
    var items : NSMutableArray?
    var count : Int = 1
    var num : Int = 0
    var arr : [String] = []
   // var count : Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        self.items = NSMutableArray()
        //self.arr = NSArray()
        while num < count11 {
            self.items?.addObject("1")
    
            arr.insert(pinggu[num], atIndex: 0)
            num++
        }
                
    }
    func insertNewObject(sender : AnyObject) {
        var row = self.items!.count
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
       // self.items?.addObject("1")
        let manager = AFHTTPRequestOperationManager()
        var zxf : AFJSONRequestSerializer = AFJSONRequestSerializer()
        var fxz : AFJSONResponseSerializer = AFJSONResponseSerializer()
        manager.requestSerializer = zxf
        manager.responseSerializer = fxz
        manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/hi5", parameters: nil, success: { (operation: AFHTTPRequestOperation!,
            responseObject: AnyObject!) in
            //println("success")
            var most : NSMutableArray!
            most = responseObject as NSMutableArray!
            var num : Int = 0
            while(num < most?.count){
                var s : String
               
                s = most?.objectAtIndex(num)["id"] as NSString
               
                var ss : Int! = s.toInt()
                if (ss >= mostpinggu)
                {
                    mostpinggu = ss
                    println(ss)
                }
                num++
            }
            mostpinggu = mostpinggu + 1
            var name : String = test2!
            var id : String = "\(mostpinggu)"
            var params : Dictionary<String,String> = ["deliver" : name , "id" : id]
            
            manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/add", parameters: params, success: { (operation: AFHTTPRequestOperation!,
                responseObject: AnyObject!) in
                //println("success")
                let responseDict = responseObject as NSDictionary!
                var panduan : String = responseDict["success"] as NSString
                if(panduan == "yes"){
                    println("OK")
                }
                },
                failure: { (operation: AFHTTPRequestOperation!,
                    error: NSError!) in
                    //Handle Error
                    println(error)
                    println(operation.responseString)
            })
            
            self.arr.insert(id, atIndex: 0)
            self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
            },
            failure: { (operation: AFHTTPRequestOperation!,
                error: NSError!) in
                //Handle Error
                println(error)
                println(operation.responseString)
        })
        
        
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
        return self.arr.count
    }
  //  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
  //  }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("item1", forIndexPath: indexPath) as delivernumcell
        let n : Int = self.items!.count
        cell.number.text = "\(arr[indexPath.row])"
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
        var params : Dictionary<String,String> = ["deliver" : name , "id" : id ]
        
        manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/find", parameters: params, success: { (operation: AFHTTPRequestOperation!,
            responseObject: AnyObject!) in
            
            var back = responseObject as NSMutableArray!
            
        let view1 = self.storyboard?.instantiateViewControllerWithIdentifier("Delivertable") as delivertable
        view1.navigationItem.title = "评估表：\(self.arr[indexPath.row])"
        //liebiao2 = back.objectAtIndex(0) as NSDictionary
        liebiao1[0] = back.objectAtIndex(0)["deliver"] as NSString
        liebiao1[1] = back.objectAtIndex(0)["salesman"] as NSString
           liebiao1[2] = back.objectAtIndex(0)["firstnum"] as NSString
            liebiao1[3] = back.objectAtIndex(0)["yearmonth"] as NSString
           liebiao1[4] = back.objectAtIndex(0)["contact"] as NSString
            liebiao1[5] = back.objectAtIndex(0)["contactphone"] as NSString
           liebiao1[6] = back.objectAtIndex(0)["firstunit"] as NSString
            liebiao1[7] = back.objectAtIndex(0)["secondunit"] as NSString
            liebiao1[8] = back.objectAtIndex(0)["thirdunit"] as NSString
            liebiao1[9] = back.objectAtIndex(0)["appraiser"] as NSString
            liebiao1[10] = back.objectAtIndex(0)["belong"] as NSString
            liebiao1[11] = back.objectAtIndex(0)["local"] as NSString
            liebiao1[12] = back.objectAtIndex(0)["firstremark"] as NSString
            liebiao1[13] = back.objectAtIndex(0)["areaname"] as NSString
            liebiao1[14] = back.objectAtIndex(0)["realdate"] as NSString
            liebiao1[15] = back.objectAtIndex(0)["outtime"] as NSString
            liebiao1[16] = back.objectAtIndex(0)["total"] as NSString
            liebiao1[17] = back.objectAtIndex(0)["firstevaluate"] as NSString
            liebiao1[18] = back.objectAtIndex(0)["firstsuggestion"] as NSString
            liebiao1[19] = back.objectAtIndex(0)["secondevaluate"] as NSString
            liebiao1[20] = back.objectAtIndex(0)["secondsuggestion"] as NSString
            liebiao1[21] = back.objectAtIndex(0)["reportnum"] as NSString
            liebiao1[22] = back.objectAtIndex(0)["reportdate"] as NSString
            liebiao1[23] = back.objectAtIndex(0)["reportstyle"] as NSString
            liebiao1[24] = back.objectAtIndex(0)["secondremark"] as NSString
            liebiao1[25] = back.objectAtIndex(0)["pay"] as NSString
            liebiao1[26] = back.objectAtIndex(0)["thirdremark"] as NSString
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
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            // listVideos.removeObjectAtIndex(indexPath.row)
           //list.removeLast()
           // self.items?.removeObjectAtIndex(indexPath.row)
            let manager = AFHTTPRequestOperationManager()
            var zxf : AFJSONRequestSerializer = AFJSONRequestSerializer()
            var fxz : AFJSONResponseSerializer = AFJSONResponseSerializer()
            manager.requestSerializer = zxf
            manager.responseSerializer = fxz
            var name : String = test2!
            var id : String = "\(arr[indexPath.row])"
            var params : Dictionary<String,String> = ["deliver" : name , "id" : id]
            
            manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/delete", parameters: params, success: { (operation: AFHTTPRequestOperation!,
                responseObject: AnyObject!) in
                //println("success")
                let responseDict = responseObject as NSDictionary!
                var panduan : String = responseDict["success"] as NSString
                if(panduan == "yes"){
                    println("OK")
                }
                },
                failure: { (operation: AFHTTPRequestOperation!,
                    error: NSError!) in
                    //Handle Error
                    println(error)
                    println(operation.responseString)
            })
            self.arr.removeAtIndex(indexPath.row)
            print("\(indexPath.row)")
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    //在编辑状态，可以拖动设置item位置
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    
    
}
