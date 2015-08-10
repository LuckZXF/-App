//
//  salesmansearch.swift
//  App
//
//  Created by 赵希帆 on 15/6/15.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class moneysearch : UIViewController,UIAlertViewDelegate{
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
        var params : Dictionary<String,String> = ["firstnum" : number]
        println(params)
        manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/search4", parameters: params, success: { (operation: AFHTTPRequestOperation!,
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
                var params : Dictionary<String,String> = ["firstnum" : number]
                println(params)
                manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/search44", parameters: params, success: { (operation: AFHTTPRequestOperation!,
                    responseObject: AnyObject!) in
                    var back = responseObject as NSMutableArray!
                    
                    var id : String = back.objectAtIndex(0)["id"] as NSString
                    
                    //liebiao2 = back.objectAtIndex(0) as NSDictionary
                   
                                        //liebiao2 = back.objectAtIndex(0) as NSDictionary
                    let view1 = self.storyboard?.instantiateViewControllerWithIdentifier("moneytable2") as moneytable2
                    
                    view1.navigationItem.title = "评估表：\(id)"
                    //liebiao2 = back.objectAtIndex(0) as NSDictionary
                    money2[0] = back.objectAtIndex(0)["firstnum"] as NSString
                    money2[1] = back.objectAtIndex(0)["yearmonth"] as NSString
                    money2[2] = back.objectAtIndex(0)["contact"] as NSString
                    money2[3] = back.objectAtIndex(0)["contactphone"] as NSString
                    money2[4] = back.objectAtIndex(0)["firstunit"] as NSString
                    money2[5] = back.objectAtIndex(0)["secondunit"] as NSString
                    money2[6] = back.objectAtIndex(0)["thirdunit"] as NSString
                    money2[7] = back.objectAtIndex(0)["appraiser"] as NSString
                    money2[8] = back.objectAtIndex(0)["local"] as NSString
                    money2[9] = back.objectAtIndex(0)["realdate"] as NSString
                    money2[10] = back.objectAtIndex(0)["total"] as NSString
                    money2[11] = back.objectAtIndex(0)["firstevaluate"] as NSString
                    money2[12] = back.objectAtIndex(0)["firstsuggestion"] as NSString
                    money2[13] = back.objectAtIndex(0)["secondevaluate"] as NSString
                    money2[14] = back.objectAtIndex(0)["secondsuggestion"] as NSString
                    money2[15] = back.objectAtIndex(0)["reportnum"] as NSString
                    money2[16] = back.objectAtIndex(0)["reportdate"] as NSString
                    money2[17] = back.objectAtIndex(0)["reportstyle"] as NSString
                    money2[18] = back.objectAtIndex(0)["pay"] as NSString
                    money2[19] = back.objectAtIndex(0)["thirdremark"] as NSString
                    deliverwho = back.objectAtIndex(0)["deliver"] as NSString
                    deliverwhoid = back.objectAtIndex(0)["id"] as NSString
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
