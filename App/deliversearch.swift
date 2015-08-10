//
//  deliversearch.swift
//  App
//
//  Created by 赵希帆 on 15/6/15.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class deliversearch : UIViewController,UIAlertViewDelegate{
    
    @IBOutlet weak var search: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func submit(sender: AnyObject) {
      
        let manager = AFHTTPRequestOperationManager()
        var zxf : AFJSONRequestSerializer = AFJSONRequestSerializer()
        var fxz : AFJSONResponseSerializer = AFJSONResponseSerializer()
        manager.requestSerializer = zxf
        manager.responseSerializer = fxz
        var number : String = search.text
        var name : String = test2!
        var params : Dictionary<String,String> = ["firstnum" : number,"deliver" : name]
        println(params)
        manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/search1", parameters: params, success: { (operation: AFHTTPRequestOperation!,
            responseObject: AnyObject!) in
            //println("success")
            var back1 = responseObject as NSDictionary!
            var panduan : String = back1["result"] as NSString
            
            if(panduan == "no")
            {
                let alert = UIAlertView()
                alert.title = "提醒"
                alert.message = "初评编号有误或者您权限不够"
                alert.addButtonWithTitle("ok")
                alert.show()
            }
            else{
                var params : Dictionary<String,String> = ["firstnum" : number,"deliver" : name]
                println(params)
                manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/search11", parameters: params, success: { (operation: AFHTTPRequestOperation!,
                    responseObject: AnyObject!) in
                        var back = responseObject as NSMutableArray!
                    let view1 = self.storyboard?.instantiateViewControllerWithIdentifier("Delivertable") as delivertable
                    var id : String = back.objectAtIndex(0)["id"] as NSString
                    view1.navigationItem.title = "评估表：\(id)"
                    //liebiao2 = back.objectAtIndex(0) as NSDictionary
                    liebiao1[0] = back.objectAtIndex(0)["deliver"] as NSString
                    liebiao1[1] = back.objectAtIndex(0)["salesman"] as NSString
                    liebiao1[2] = back.objectAtIndex(0)["firstnum"] as NSString
                    liebiao1[3] = back.objectAtIndex(0)["yearmonth"] as NSString
                    liebiao1[4] = back.objectAtIndex(0)["contact"] as NSString
                    liebiao1[5] = back.objectAtIndex(0)["contactphone"] as NSString
                    liebiao1[6] = back.objectAtIndex(0)["firstunit"] as NSString
                    liebiao1[7] = back.objectAtIndex(0)["secondunit"] as NSString
                    liebiao1[8] = back.objectAtIndex(0)["thirdunit"] as NSString
                    liebiao1[9] = back.objectAtIndex(0)["appraiser"] as NSString
                    liebiao1[10] = back.objectAtIndex(0)["belong"] as NSString
                    liebiao1[11] = back.objectAtIndex(0)["local"] as NSString
                    liebiao1[12] = back.objectAtIndex(0)["firstremark"] as NSString
                    liebiao1[13] = back.objectAtIndex(0)["areaname"] as NSString
                    liebiao1[14] = back.objectAtIndex(0)["realdate"] as NSString
                    liebiao1[15] = back.objectAtIndex(0)["outtime"] as NSString
                    liebiao1[16] = back.objectAtIndex(0)["total"] as NSString
                    liebiao1[17] = back.objectAtIndex(0)["firstevaluate"] as NSString
                    liebiao1[18] = back.objectAtIndex(0)["firstsuggestion"] as NSString
                    liebiao1[19] = back.objectAtIndex(0)["secondevaluate"] as NSString
                    liebiao1[20] = back.objectAtIndex(0)["secondsuggestion"] as NSString
                    liebiao1[21] = back.objectAtIndex(0)["reportnum"] as NSString
                    liebiao1[22] = back.objectAtIndex(0)["reportdate"] as NSString
                    liebiao1[23] = back.objectAtIndex(0)["reportstyle"] as NSString
                    liebiao1[24] = back.objectAtIndex(0)["secondremark"] as NSString
                    liebiao1[25] = back.objectAtIndex(0)["pay"] as NSString
                    liebiao1[26] = back.objectAtIndex(0)["thirdremark"] as NSString
                    self.navigationController?.pushViewController(view1, animated: true)
                    },
                    failure: { (operation: AFHTTPRequestOperation!,
                        error: NSError!) in
                        //Handle Error
                        println(error)
                        println(operation.responseString)
                })
                
            }
            
            
            },
            failure: { (operation: AFHTTPRequestOperation!,
                error: NSError!) in
                //Handle Error
                println(error)
                println(operation.responseString)
        })

    }
    @IBAction func back(sender: AnyObject) {
        search.resignFirstResponder()
    }
    
}
