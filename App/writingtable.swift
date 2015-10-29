//
//  writingtable.swift
//  App
//
//  Created by 赵希帆 on 15/6/10.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class writingtable : UITableViewController , UIAlertViewDelegate {
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
        while num < count66 {
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
        return count66
    }
    //  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
    //  }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("item17", forIndexPath: indexPath) as! writingtablecell
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
        var params : Dictionary<String,String> = ["id" : id ]
        
        manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/find4", parameters: params, success: { (operation: AFHTTPRequestOperation!,
            responseObject: AnyObject!) in
            
            var back = responseObject as! NSMutableArray!
            
            let view1 = self.storyboard?.instantiateViewControllerWithIdentifier("writingtable2") as! writingtable2
            view1.navigationItem.title = "评估表：\(self.arr[indexPath.row])"
            //liebiao2 = back.objectAtIndex(0) as NSDictionary
            writing2[0] = back.objectAtIndex(0)["firstnum"] as! String
            writing2[1] = back.objectAtIndex(0)["yearmonth"] as! String
            writing2[2] = back.objectAtIndex(0)["contact"] as! String
            writing2[3] = back.objectAtIndex(0)["contactphone"] as! String
            writing2[4] = back.objectAtIndex(0)["appraiser"] as! String
            writing2[5] = back.objectAtIndex(0)["belong"] as! String
            writing2[6] = back.objectAtIndex(0)["local"] as! String
            writing2[7] = back.objectAtIndex(0)["total"] as! String
            writing2[8] = back.objectAtIndex(0)["firstevaluate"] as! String
            writing2[9] = back.objectAtIndex(0)["firstsuggestion"] as! String
            writing2[10] = back.objectAtIndex(0)["secondevaluate"] as! String
            writing2[11] = back.objectAtIndex(0)["secondsuggestion"] as! String
            writing2[12] = back.objectAtIndex(0)["reportnum"] as! String
            writing2[13] = back.objectAtIndex(0)["reportdate"] as! String
            writing2[14] = back.objectAtIndex(0)["reportstyle"] as! String
            writing2[15] = back.objectAtIndex(0)["secondremark"] as! String
            
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
