//
//  salesmantable2.swift
//  App
//
//  Created by 赵希帆 on 15/6/8.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class appraisertable2 : UITableViewController,UIAlertViewDelegate {
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
            var params : Dictionary<String,String> = ["firstnum" : appraiser2[0],"yearmonth" : appraiser2[1],"contact" : appraiser2[2],"contactphone" : appraiser2[3],"firstunit" : appraiser2[4],"secondunit" : appraiser2[5],"thirdunit" : appraiser2[6],"appraiser" : appraiser2[7],"belong" : appraiser2[8],"local" : appraiser2[9] ,"firstremark" : appraiser2[10],"areaname" : appraiser2[11],"realdate" : appraiser2[12],"outtime" : appraiser2[13],"total" : appraiser2[14]]
            params.updateValue(appraiser2[15], forKey: "firstevaluate")
            params.updateValue(appraiser2[16], forKey: "firstsuggestion")
            params.updateValue(appraiser2[17], forKey: "secondevaluate")
            params.updateValue(appraiser2[18], forKey: "secondsuggestion")
            params.updateValue(appraiser2[19], forKey: "reportnum")
            params.updateValue(appraiser2[20], forKey: "reportdate")
            params.updateValue(appraiser2[21], forKey: "reportstyle")
            params.updateValue(deliverwho!, forKey: "deliver")
            params.updateValue(deliverwhoid!, forKey: "id")
            manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/appraiser", parameters: params, success: { (operation: AFHTTPRequestOperation!,
                responseObject: AnyObject!) in
                println("success")
                let responseDict = responseObject as NSDictionary!
                var panduan : String = responseDict["result"] as NSString
                if(panduan == "yes"){
                     println("OK")
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
        return appraiser1.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("item14", forIndexPath: indexPath) as appraisertable2cell
        cell.firstlabel.text = appraiser1[indexPath.row]
        // cell.secondlabel.text = count1?.objectAtIndex(index)["id"] as NSString/
        cell.secondlabel.text = appraiser2[indexPath.row]
        //liebiao2[indexPath.row]
        if(indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 4 || indexPath.row == 5 || indexPath.row == 6 || indexPath.row == 7 || indexPath.row == 8 || indexPath.row == 14 || indexPath.row >= 16)
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
        if(indexPath.row == 2)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("contactView") as contactView
            view.navigationItem.title = "联系人"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 3)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("contactphoneView") as contactphoneView
            view.navigationItem.title = "联系电话"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 9)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("localView") as localView
            view.navigationItem.title = "房产坐落地"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 10)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("firstremarkView") as firstremarkView
            view.navigationItem.title = "备注（评估员）"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 11)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("areanameView") as areanameView
            view.navigationItem.title = "小区名称"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 12)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("dateViewController") as dateViewController
            view.navigationItem.title = "实际评估日期"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 13)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("outtimeView") as outtimeView
            view.navigationItem.title = "外勤工作时间"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 15)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("firstevaluateView") as firstevaluateView
            view.navigationItem.title = "一级审核评估师"
            self.navigationController?.pushViewController(view, animated: true)
        }
        
    }
    
}
