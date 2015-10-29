//
//  evaluate1table.swift
//  App
//
//  Created by 赵希帆 on 15/6/13.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class evaluate11table : UITableViewController,UIAlertViewDelegate {
    var list : [Int] = [2,3]
    var items : NSMutableArray?
    var count : Int = 1
    var num : Int = 0
    var arr : [String] = []
    // var count : Int!
    //  @IBOutlet weak var searchbar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = NSMutableArray()
        // searchbar.placeholder = "输入初评编号搜索"
        while num < count99 {
            self.items?.addObject("1")
            print(num)
            arr.insert(pinggu[num], atIndex: 0)
            num++
            
        }
        
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
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
        return count99
    }
    //  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
    //  }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("item21", forIndexPath: indexPath) as! evaluate11cell
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
        var params : Dictionary<String,String> = ["id" : id ,"secondevaluate" : name]
        
        manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/find6", parameters: params, success: { (operation: AFHTTPRequestOperation!,
            responseObject: AnyObject!) in
            
            var back = responseObject as! NSMutableArray!
            
            let view1 = self.storyboard?.instantiateViewControllerWithIdentifier("evaluate2table2") as! evaluate22table
            view1.navigationItem.title = "评估表：\(self.arr[indexPath.row])"
            //liebiao2 = back.objectAtIndex(0) as NSDictionary
            evaluate22[0] = back.objectAtIndex(0)["firstnum"] as! String
            evaluate22[1] = back.objectAtIndex(0)["yearmonth"] as! String
            evaluate22[2] = back.objectAtIndex(0)["contact"] as! String
            evaluate22[3] = back.objectAtIndex(0)["contactphone"] as! String
            evaluate22[4] = back.objectAtIndex(0)["firstunit"] as! String
            evaluate22[5] = back.objectAtIndex(0)["secondunit"] as! String
            evaluate22[6] = back.objectAtIndex(0)["appraiser"] as! String
            evaluate22[7] = back.objectAtIndex(0)["belong"] as! String
            evaluate22[8] = back.objectAtIndex(0)["local"] as! String
            evaluate22[9] = back.objectAtIndex(0)["areaname"] as! String
            evaluate22[10] = back.objectAtIndex(0)["realdate"] as! String
            evaluate22[11] = back.objectAtIndex(0)["total"] as! String
            evaluate22[12] = back.objectAtIndex(0)["firstevaluate"] as! String
            evaluate22[13] = back.objectAtIndex(0)["firstsuggestion"] as! String
            evaluate22[14] = back.objectAtIndex(0)["secondsuggestion"] as! String
            evaluate22[15] = back.objectAtIndex(0)["reportnum"] as! String
            evaluate22[16] = back.objectAtIndex(0)["reportdate"] as! String
            evaluate22[17] = back.objectAtIndex(0)["reportstyle"] as! String
            
            
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
