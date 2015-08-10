//
//  systemView.swift
//  App
//
//  Created by 赵希帆 on 15/6/4.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit
var add : Bool = true
class systemView : UITableViewController ,UIAlertViewDelegate {
    var items : NSMutableArray?
    var num : Int = 0
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        self.items = NSMutableArray()
        //self.arr = NSArray()
        while num < count2?.count {
            self.items?.addObject("1")
            num++
            
        }
        
    }
    func insertNewObject(sender : AnyObject) {
        if(add == true)
        {
        var row = self.items!.count
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        // self.items?.addObject("1")
        let manager = AFHTTPRequestOperationManager()
        var zxf : AFJSONRequestSerializer = AFJSONRequestSerializer()
        var fxz : AFJSONResponseSerializer = AFJSONResponseSerializer()
        manager.requestSerializer = zxf
        manager.responseSerializer = fxz
        //var name : String = test2!
       // var id : String = "\(mostpinggu)"
       // var params : Dictionary<String,String> = ["deliver" : name , "id" : id]
        
        manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/add2", parameters: nil, success: { (operation: AFHTTPRequestOperation!,
            responseObject: AnyObject!) in
            //println("success")
            let responseDict = responseObject as NSDictionary!
            var panduan : String = responseDict["success"] as NSString
            if(panduan == "yes"){
                println("OK")
                add = false
            }
            },
            failure: { (operation: AFHTTPRequestOperation!,
                error: NSError!) in
                //Handle Error
                println(error)
                println(operation.responseString)
        })
        
        //self.arr.insert(id, atIndex: 0)
       // mostpinggu = mostpinggu + 1
        gmusername.insert("姓名", atIndex: 0)
        gmuserpower.insert("权限", atIndex: 0)
        gmuserphone.insert("", atIndex: 0)
        gmuseremail.insert("", atIndex: 0)
        gmuserid.insert("", atIndex: 0)
        gmuserpassword.insert("", atIndex: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
        }
        else{
            let alert = UIAlertView()
            alert.title = "警告"
            alert.message = "请先完善您刚创建的用户资料"
            alert.addButtonWithTitle("ok")
            alert.show()
        }
        
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
        return gmusername.count
    }
    //  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
    //  }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("item10") as systemcell
        cell.firstlabel.text = gmusername[indexPath.row]
        cell.secondlabel.text = gmuserpower[indexPath.row]
        if(cell.firstlabel.text == "姓名")
        {
            cell.backgroundColor = UIColor.redColor()
        }
        else
        {
            cell.backgroundColor = UIColor.whiteColor()
        }
      //  println(cell.firstlabel.text)
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let view = self.storyboard?.instantiateViewControllerWithIdentifier("adduserView") as adduserView
        view.navigationItem.title = "用户资料"
        view.index = indexPath.row
        self.navigationController?.pushViewController(view, animated: true)
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
            var name : String = "\(gmusername[indexPath.row])"
          //  var id : String = "\(arr[indexPath.row])"
            var params : Dictionary<String,String> = ["username" : name ]
            
            manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/delete2", parameters: params, success: { (operation: AFHTTPRequestOperation!,
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
            gmusername.removeAtIndex(indexPath.row)
            gmuserpower.removeAtIndex(indexPath.row)
            gmuserpassword.removeAtIndex(indexPath.row)
            gmuserid.removeAtIndex(indexPath.row)
            gmuserphone.removeAtIndex(indexPath.row)
            gmuseremail.removeAtIndex(indexPath.row)
            print("\(indexPath.row)")
            if(indexPath.row == 0)
            {
                add = true
            }
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    //在编辑状态，可以拖动设置item位置
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }}
