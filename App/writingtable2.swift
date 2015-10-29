//
//  salesmantable2.swift
//  App
//
//  Created by 赵希帆 on 15/6/8.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class writingtable2 : UITableViewController , UIAlertViewDelegate {
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
            var params : Dictionary<String,String> = ["firstnum" : writing2[0],"yearmonth" : writing2[1],"contact" : writing2[2],"contactphone" : writing2[3], "appraiser" : writing2[4],"belong" : writing2[5],"local" : writing2[6],"total" : writing2[7],"firstevaluate" : writing2[8],"firstsuggestion" : writing2[9],"secondecaluate" : writing2[10],"secondsuggestion" : writing2[11],"reportnum" : writing2[12],"reportdate" : writing2[13],"reportstyle" :writing2[14]]
            params.updateValue(writing2[15], forKey: "secondremark")
           
            params.updateValue(deliverwho!, forKey: "deliver")
            params.updateValue(deliverwhoid!, forKey: "id")
            manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/writing", parameters: params, success: { (operation: AFHTTPRequestOperation!,
                responseObject: AnyObject!) in
                print("success")
                let responseDict = responseObject as! NSDictionary!
                var panduan : String = responseDict["result"] as! String
                if(panduan == "yes"){
                    print("OK")
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
        return writing1.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("item18", forIndexPath: indexPath) as! writingtable2cell
        cell.firstlabel.text = money1[indexPath.row]
        // cell.secondlabel.text = count1?.objectAtIndex(index)["id"] as NSString/
        cell.secondlabel.text = money2[indexPath.row]
        //liebiao2[indexPath.row]
        if(indexPath.row == 8 || indexPath.row == 9 || indexPath.row == 10 || indexPath.row == 11 ||  indexPath.row <= 6)
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
        if(indexPath.row == 7)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("totalView") as! totalView
            view.navigationItem.title = "评估总价"
            self.navigationController?.pushViewController(view, animated: true)
            
        }
        if(indexPath.row == 12)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("reportnumView") as! reportnumView
            view.navigationItem.title = "报告编号"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 13)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("reportdateView") as! reportdateView
            view.navigationItem.title = "报告日期"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 14)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("reportstypeView") as! reportstypeView
            view.navigationItem.title = "报告类型"
            self.navigationController?.pushViewController(view, animated: true)
        }
        if(indexPath.row == 15)
        {
            let view = self.storyboard?.instantiateViewControllerWithIdentifier("secondremark") as! secondremarkView
            view.navigationItem.title = "备注（文员）"
            self.navigationController?.pushViewController(view, animated: true)
        }
        
    }
    
}
