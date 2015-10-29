//
//  evaluate2table.swift
//  App
//
//  Created by 赵希帆 on 15/6/13.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class evaluate2table : UITableViewController,UIAlertViewDelegate{
    override func viewDidLoad() {
        let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        super.viewDidLoad()
        
        
    }
    func insertNewObject(sender : AnyObject) {
        if(!isSave)
        {
            let alert = UIAlertView()
            alert.title = "提醒"
            alert.message = "您当前未修改过数据不用保存"
            alert.addButtonWithTitle("ok")
            alert.show()
            print("ok")
            
        }
        else{
            let manager = AFHTTPRequestOperationManager()
            var zxf : AFJSONRequestSerializer = AFJSONRequestSerializer()
            var fxz : AFJSONResponseSerializer = AFJSONResponseSerializer()
            manager.requestSerializer = zxf
            manager.responseSerializer = fxz
            // var name : String = test2!
            // var id : String = "\(mostpinggu)"
            var params : Dictionary<String,String> = ["firstnum" : evaluate2[0],"yearmonth" : evaluate2[1],"firstunit" : evaluate2[2],"secondunit" : evaluate2[3],"appraiser" : evaluate2[4],"belong" : evaluate2[5],"local" : evaluate2[6],"areaname" : evaluate2[7],"realdate" : evaluate2[8],"total" : evaluate2[9],"firstsuggestion" : evaluate2[10],"reportnum" : evaluate2[11],"reportdate" : evaluate2[12],"reportstyle" : evaluate2[13]]
        
           
            params.updateValue(deliverwho!, forKey: "deliver")
            params.updateValue(deliverwhoid!, forKey: "id")
            manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/firstevaluate", parameters: params, success: { (operation: AFHTTPRequestOperation!,
                responseObject: AnyObject!) in
                //println("success")
                let responseDict = responseObject as! NSDictionary!
                var panduan : String = responseDict["result"] as! String
                if(panduan == "yes"){
                    // println("OK")
                    let alert = UIAlertView()
                    alert.title = "恭喜"
                    alert.message = "评估单已提交保存"
                    alert.addButtonWithTitle("ok")
                    alert.show()
                    isSave = false
                }
                },
                failure: { (operation: AFHTTPRequestOperation!,
                    error: NSError!) in
                    //Handle Error
                    print(error)
                    print(operation.responseString)
            })
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
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
        return evaluate1.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("item20", forIndexPath: indexPath) as! evaluate2cell
        cell.firstlabel.text = evaluate1[indexPath.row]
        // cell.secondlabel.text = count1?.objectAtIndex(index)["id"] as NSString/
        cell.secondlabel.text = evaluate2[indexPath.row]
        //liebiao2[indexPath.row]
        if(indexPath.row <= 9 || indexPath.row >= 11)
        {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row == 10)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("firstsuggestView") as! firstsuggestView
            view.navigationItem.title = "一级审核意见"
            self.navigationController?.pushViewController(view, animated: true)
        }
        
       
    }
    
}
