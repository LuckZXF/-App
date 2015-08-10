//
//  salesmantable2.swift
//  App
//
//  Created by 赵希帆 on 15/6/8.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class moneytable2 : UITableViewController , UIAlertViewDelegate {
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
            var params : Dictionary<String,String> = ["firstnum" : money2[0], "yearmonth" : money2[1],"contact" : money2[2],"contactphone" : money2[3],"firstunit" : money2[4],"secondunit" : money2[5],"thirdunit" : money2[6],"appraiser" : money2[7],"local" : money2[8],"realdate" : money2[9],"total" : money2[10],"firstevaluate" : money2[11],"firstsuggestion" : money2[12],"secondevaluate" : money2[13],"secondsuggestion" : money2[14]]
            params.updateValue(money2[15], forKey: "reportnum")
            params.updateValue(money2[16], forKey: "reportdate")
            params.updateValue(money2[17], forKey: "reportstyle")
            params.updateValue(money2[18], forKey: "pay")
            params.updateValue(money2[19], forKey: "thirdremark")
            
            params.updateValue(deliverwho!, forKey: "deliver")
            params.updateValue(deliverwhoid!, forKey: "id")
            manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/money", parameters: params, success: { (operation: AFHTTPRequestOperation!,
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
        return money1.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("item16", forIndexPath: indexPath) as moneytable2cell
        cell.firstlabel.text = money1[indexPath.row]
        // cell.secondlabel.text = count1?.objectAtIndex(index)["id"] as NSString/
        cell.secondlabel.text = money2[indexPath.row]
        //liebiao2[indexPath.row]
        if(indexPath.row == 11 || indexPath.row == 12 || indexPath.row == 13 || indexPath.row == 14 ||  indexPath.row <= 9)
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
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("totalView") as totalView
            view.navigationItem.title = "评估总价"
            self.navigationController?.pushViewController(view, animated: true)
            
        }
        if(indexPath.row == 15)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("reportnumView") as reportnumView
            view.navigationItem.title = "报告编号"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 16)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("reportdateView") as reportdateView
            view.navigationItem.title = "报告日期"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 17)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("reportstypeView") as reportstypeView
            view.navigationItem.title = "报告类型"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 18)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("payView") as payView
            view.navigationItem.title = "收费"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 19){
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("thirdremarkView") as thirdremarkView
            view.navigationItem.title = "备注（财务）"
            self.navigationController?.pushViewController(view, animated: true)
        }
    }
    
}
