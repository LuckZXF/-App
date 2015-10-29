//
//  delivertable.swift
//  App
//
//  Created by 赵希帆 on 15/5/21.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class delivertable : UITableViewController ,UIAlertViewDelegate {
    
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
        var params : Dictionary<String,String> = ["deliver" : liebiao1[0] , "id" : deliverid, "salesman" : liebiao1[1], "firstnum" : liebiao1[2], "yearmonth" : liebiao1[3], "contact" : liebiao1[4], "contactphone" : liebiao1[5], "firstunit" : liebiao1[6],"secondunit" : liebiao1[7], "thirdunit" : liebiao1[8], "appraiser" : liebiao1[9], "belong" : liebiao1[10], "local" : liebiao1[11], "firstremark" : liebiao1[12], "areaname" : liebiao1[13] , "realdate" : liebiao1[14]]
        params.updateValue(liebiao1[15], forKey: "outtime")
        params.updateValue(liebiao1[16], forKey: "total")
        params.updateValue(liebiao1[17], forKey: "firstevaluate")
        params.updateValue(liebiao1[18], forKey: "firstsuggestion")
        params.updateValue(liebiao1[19], forKey: "secondevaluate")
        params.updateValue(liebiao1[20], forKey: "secondsuggestion")
        params.updateValue(liebiao1[21], forKey: "reportnum")
        params.updateValue(liebiao1[22], forKey: "reportdate")
        params.updateValue(liebiao1[23], forKey: "reportstyle")
        params.updateValue(liebiao1[24], forKey: "secondremark")
        params.updateValue(liebiao1[25], forKey: "pay")
        params.updateValue(liebiao1[26], forKey: "thirdremark")
        manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/deliver", parameters: params, success: { (operation: AFHTTPRequestOperation!,
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
        return liebiao.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("item4", forIndexPath: indexPath) as! DeliverDetail
        cell.firstlabel.text = liebiao[indexPath.row]
       // cell.secondlabel.text = count1?.objectAtIndex(index)["id"] as NSString/
        cell.secondlabel.text = liebiao1[indexPath.row]
        //liebiao2[indexPath.row]
        if(indexPath.row == 0)
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
        if(indexPath.row == 0)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("changeMessage") as! changeMessage
            self.navigationController?.pushViewController(view , animated: true)
        }
        if (indexPath.row == 1)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("salesmanView") as! salesmanView
            view.navigationItem.title = liebiao[indexPath.row]
            self.navigationController?.pushViewController(view, animated: true)
        }
        if (indexPath.row == 2)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("firstnumView") as! firstnumView
            view.navigationItem.title = "初评编号"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if ( indexPath.row == 3)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("yearmonthView")
            as! yearmonthView
            view.navigationItem.title = "期间归属"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if (indexPath.row == 4)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("contactView") as! contactView
            view.navigationItem.title = "联系人"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if (indexPath.row == 5)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("contactphoneView") as! contactphoneView
            view.navigationItem.title = "联系电话"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if (indexPath.row == 6)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("firstunitView") as! firstunitView
            view.navigationItem.title = "一级派单单位"
           // view.firstunit.text = "其他"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if ( indexPath.row == 7 )
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("secondunitView") as! secondunitView
            view.navigationItem.title = "二级派单单位"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if (indexPath.row == 8)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("thirdunitView") as! thirdunitView
            view.navigationItem.title = "三级派单单位"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if (indexPath.row == 9)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("appraiserView") as! appraiserView
            view.navigationItem.title = "评估员"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 10)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("belongView") as! belongView
            view.navigationItem.title = "属地"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if (indexPath.row == 11)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("localView") as! localView
            view.navigationItem.title = "房产坐落地"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if (indexPath.row == 12)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("firstremarkView") as! firstremarkView
            view.navigationItem.title = "备注"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 13)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("areanameView") as! areanameView
            view.navigationItem.title = "小区名称"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 14)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("dateViewController") as! dateViewController
            view.navigationItem.title = "实际评估日期"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 15)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("outtimeView") as! outtimeView
            view.navigationItem.title = "外勤工作时间"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 16)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("totalView") as! totalView
            view.navigationItem.title = "评估总价"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 17)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("firstevaluateView") as! firstevaluateView
            view.navigationItem.title = "一级审核评估师"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if( indexPath.row == 18)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("firstsuggestView") as! firstsuggestView
            print("sss", terminator: "")
            view.navigationItem.title = "一级审核意见"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 19)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("secondevaluateView") as! secondevaluateView
            view.navigationItem.title = "二级审核评估师"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 20)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("secondsuggestionView") as! secondsuggestionView
            view.navigationItem.title = "二级审核意见"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 21)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("reportnumView") as! reportnumView
            view.navigationItem.title = "报告编号"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 22)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("reportdateView") as! reportdateView
            view.navigationItem.title = "报告日期"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if (indexPath.row == 23)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("reportstypeView") as! reportstypeView
            view.navigationItem.title = "报告类型"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 24)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("secondremarkView") as! secondremarkView
            view.navigationItem.title = "备注（文员）"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if (indexPath.row == 25)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("payView") as! payView
            view.navigationItem.title = "收费"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 26)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("thirdremarkView") as! thirdremarkView
            view.navigationItem.title = "备注（财务用）"
            self.navigationController?.pushViewController(view, animated: true)
        }
    }
}
