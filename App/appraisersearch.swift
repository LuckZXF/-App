//
//  salesmansearch.swift
//  App
//
//  Created by 赵希帆 on 15/6/15.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class appraisersearch : UIViewController,UIAlertViewDelegate{
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
        var params : Dictionary<String,String> = ["firstnum" : number,"appraiser" : name]
        println(params)
        manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/search3", parameters: params, success: { (operation: AFHTTPRequestOperation!,
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
                var params : Dictionary<String,String> = ["firstnum" : number,"appraiser" : name]
                println(params)
                manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/search33", parameters: params, success: { (operation: AFHTTPRequestOperation!,
                    responseObject: AnyObject!) in
                    var back = responseObject as NSMutableArray!
                    
                    var id : String = back.objectAtIndex(0)["id"] as NSString
                    
                    //liebiao2 = back.objectAtIndex(0) as NSDictionary
                    
                    let view1 = self.storyboard?.instantiateViewControllerWithIdentifier("appraisertable2") as appraisertable2
                   view1.navigationItem.title = "评估表：\(id)"
                    //liebiao2 = back.objectAtIndex(0) as NSDictionary
                    appraiser2[0] = back.objectAtIndex(0)["firstnum"] as NSString
                    appraiser2[1] = back.objectAtIndex(0)["yearmonth"] as NSString
                    appraiser2[2] = back.objectAtIndex(0)["contact"] as NSString
                    appraiser2[3] = back.objectAtIndex(0)["contactphone"] as NSString
                    appraiser2[4] = back.objectAtIndex(0)["firstunit"] as NSString
                    appraiser2[5] = back.objectAtIndex(0)["secondunit"] as NSString
                    appraiser2[6] = back.objectAtIndex(0)["thirdunit"] as NSString
                    appraiser2[7] = back.objectAtIndex(0)["appraiser"] as NSString
                    appraiser2[8] = back.objectAtIndex(0)["belong"] as NSString
                    appraiser2[9] = back.objectAtIndex(0)["local"] as NSString
                    appraiser2[10] = back.objectAtIndex(0)["firstremark"] as NSString
                    appraiser2[11] = back.objectAtIndex(0)["areaname"] as NSString
                    appraiser2[12] = back.objectAtIndex(0)["realdate"] as NSString
                    appraiser2[13] = back.objectAtIndex(0)["outtime"] as NSString
                    appraiser2[14] = back.objectAtIndex(0)["total"] as NSString
                    appraiser2[15] = back.objectAtIndex(0)["firstevaluate"] as NSString
                    appraiser2[16] = back.objectAtIndex(0)["firstsuggestion"] as NSString
                    appraiser2[17] = back.objectAtIndex(0)["secondevaluate"] as NSString
                    appraiser2[18] = back.objectAtIndex(0)["secondsuggestion"] as NSString
                    appraiser2[19] = back.objectAtIndex(0)["reportnum"] as NSString
                    appraiser2[20] = back.objectAtIndex(0)["reportdate"] as NSString
                    appraiser2[21] = back.objectAtIndex(0)["reportstyle"] as NSString
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
