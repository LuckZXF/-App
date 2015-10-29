//
//  salesmantable2.swift
//  App
//
//  Created by 赵希帆 on 15/6/8.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class salesmantable2 : UITableViewController,UIAlertViewDelegate {
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
        
            var params : Dictionary<String,String> = ["firstnum" : salesman2[0],"yearmonth" : salesman2[1],"contact" : salesman2[2],"contactphone" : salesman2[3],"firstunit" : salesman2[4],"secondunit" : salesman2[5],"thirdunit" : salesman2[6],"appraiser" : salesman2[7],"belong" : salesman2[8],"local" : salesman2[9],"firstremark" : salesman2[10],"areaname" : salesman2[11],"realdate" : salesman2[12],"total" : salesman2[13], "firstevaluate" : salesman2[14]]
            params.updateValue(salesman2[15], forKey: "firstsuggestion")
            params.updateValue(salesman2[16], forKey: "secondevaluate")
            params.updateValue(salesman2[17], forKey: "secondsuggestion")
            params.updateValue(salesman2[18], forKey: "reportnum")
            params.updateValue(salesman2[19], forKey: "reportdate")
            params.updateValue(salesman2[20], forKey: "reportstyle")
            params.updateValue(salesman2[21], forKey: "pay")
            params.updateValue(deliverwho!, forKey: "deliver")
            params.updateValue(deliverwhoid!, forKey: "id")
            manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/salesman", parameters: params, success: { (operation: AFHTTPRequestOperation!,
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
        return salesman1.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("item12", forIndexPath: indexPath) as! salesmantable2cell
        cell.firstlabel.text = salesman1[indexPath.row]
        // cell.secondlabel.text = count1?.objectAtIndex(index)["id"] as NSString/
        cell.secondlabel.text = salesman2[indexPath.row]
        //liebiao2[indexPath.row]
        if(indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 7 || indexPath.row >= 12)
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
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("contactView") as! contactView
            view.navigationItem.title = "联系人"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 3)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("contactphoneView") as! contactphoneView
            view.navigationItem.title = "联系电话"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 4)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("firstunitView") as! firstunitView
            view.navigationItem.title = "一级派单单位"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 5)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("secondunitView") as! secondunitView
            view.navigationItem.title = "二级派单单位"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 6)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("thirdunitView") as! thirdunitView
            view.navigationItem.title = "三级派单单位"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 8)
        {
            let view  = self.storyboard?.instantiateViewControllerWithIdentifier("belongView") as! belongView
            view.navigationItem.title = "属地"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 9)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("localView") as! localView
            view.navigationItem.title = "房产坐落地"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 10)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("firstremarkView") as! firstremarkView
            view.navigationItem.title = "备注（评估员）"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 11)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("areanameView") as! areanameView
            view.navigationItem.title = "小区名称"
            self.navigationController?.pushViewController(view, animated: true)
        }
    }
    
}
