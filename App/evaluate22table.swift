//
//  evaluate2table.swift
//  App
//
//  Created by 赵希帆 on 15/6/13.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class evaluate22table : UITableViewController,UIAlertViewDelegate{
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
            println("ok")
            
        }
        else{
            let manager = AFHTTPRequestOperationManager()
            var zxf : AFJSONRequestSerializer = AFJSONRequestSerializer()
            var fxz : AFJSONResponseSerializer = AFJSONResponseSerializer()
            manager.requestSerializer = zxf
            manager.responseSerializer = fxz
            // var name : String = test2!
            // var id : String = "\(mostpinggu)"
            var params : Dictionary<String,String> = ["firstnum" : evaluate22[0],"yearmonth" : evaluate22[1],"contact" : evaluate22[2],"contactphone" : evaluate22[3],"firstunit" : evaluate22[4],"secondunit" : evaluate22[5],"appraiser" : evaluate22[6],"belong" : evaluate22[7],"local" : evaluate22[8],"areaname" : evaluate22[9],"realdate" : evaluate22[10],"total" : evaluate22[11],"firstevaluate" : evaluate22[12],"firstsuggestion" : evaluate22[13],"secondsuggestion" : evaluate22[14]]
            params.updateValue(evaluate22[15], forKey: "reportnum")
            params.updateValue(evaluate22[16], forKey: "reportdate")
            params.updateValue(evaluate22[17], forKey: "reportstyle")
            
            
            
            params.updateValue(deliverwho!, forKey: "deliver")
            params.updateValue(deliverwhoid!, forKey: "id")
            manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/secondevaluate", parameters: params, success: { (operation: AFHTTPRequestOperation!,
                responseObject: AnyObject!) in
                //println("success")
                let responseDict = responseObject as NSDictionary!
                var panduan : String = responseDict["result"] as NSString
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
                    println(error)
                    println(operation.responseString)
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
        return evaluate11.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("item22", forIndexPath: indexPath) as evaluate22cell
        cell.firstlabel.text = evaluate11[indexPath.row]
        // cell.secondlabel.text = count1?.objectAtIndex(index)["id"] as NSString/
        cell.secondlabel.text = evaluate22[indexPath.row]
        //liebiao2[indexPath.row]
        if(indexPath.row <= 13 || indexPath.row >= 15)
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
        if(indexPath.row == 14)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("secondsuggestionView") as secondsuggestionView
            view.navigationItem.title = "二级审核意见"
            self.navigationController?.pushViewController(view, animated: true)
        }
        
        
    }
    
}
