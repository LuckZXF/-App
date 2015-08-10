//
//  salesmansearch.swift
//  App
//
//  Created by 赵希帆 on 15/6/15.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class evaluate1search : UIViewController,UIAlertViewDelegate{
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
        var params : Dictionary<String,String> = ["firstnum" : number,"firstevaluate" : name]
        println(params)
        manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/search6", parameters: params, success: { (operation: AFHTTPRequestOperation!,
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
                var params : Dictionary<String,String> = ["firstnum" : number,"firstevaluate" : name]
                println(params)
                manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/search66", parameters: params, success: { (operation: AFHTTPRequestOperation!,
                    responseObject: AnyObject!) in
                    var back = responseObject as NSMutableArray!
                    
                    var id : String = back.objectAtIndex(0)["id"] as NSString
                    
                    //liebiao2 = back.objectAtIndex(0) as NSDictionary
                    
                     let view1 = self.storyboard?.instantiateViewControllerWithIdentifier("evaluate1table2") as evaluate2table
                    view1.navigationItem.title = "评估表：\(id)"                    
                    
                    //liebiao2 = back.objectAtIndex(0) as NSDictionary
                    evaluate2[0] = back.objectAtIndex(0)["firstnum"] as NSString
                    evaluate2[1] = back.objectAtIndex(0)["yearmonth"] as NSString
                    evaluate2[2] = back.objectAtIndex(0)["firstunit"] as NSString
                    evaluate2[3] = back.objectAtIndex(0)["secondunit"] as NSString
                    evaluate2[4] = back.objectAtIndex(0)["appraiser"] as NSString
                    evaluate2[5] = back.objectAtIndex(0)["belong"] as NSString
                    evaluate2[6] = back.objectAtIndex(0)["local"] as NSString
                    evaluate2[7] = back.objectAtIndex(0)["areaname"] as NSString
                    evaluate2[8] = back.objectAtIndex(0)["realdate"] as NSString
                    evaluate2[9] = back.objectAtIndex(0)["total"] as NSString
                    evaluate2[10] = back.objectAtIndex(0)["firstsuggestion"] as NSString
                    evaluate2[11] = back.objectAtIndex(0)["reportnum"] as NSString
                    evaluate2[12] = back.objectAtIndex(0)["reportdate"] as NSString
                    evaluate2[13] = back.objectAtIndex(0)["reportstyle"] as NSString
                    
                    
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
