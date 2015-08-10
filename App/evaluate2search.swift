//
//  salesmansearch.swift
//  App
//
//  Created by 赵希帆 on 15/6/15.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class evaluate2search : UIViewController,UIAlertViewDelegate{
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
        var params : Dictionary<String,String> = ["firstnum" : number,"secondevaluate" : name]
        println(params)
        manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/search7", parameters: params, success: { (operation: AFHTTPRequestOperation!,
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
                var params : Dictionary<String,String> = ["firstnum" : number,"secondevaluate" : name]
                println(params)
                manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/search77", parameters: params, success: { (operation: AFHTTPRequestOperation!,
                    responseObject: AnyObject!) in
                    var back = responseObject as NSMutableArray!
                    
                    var id : String = back.objectAtIndex(0)["id"] as NSString
                    
                    //liebiao2 = back.objectAtIndex(0) as NSDictionary
                    
                    let view1 = self.storyboard?.instantiateViewControllerWithIdentifier("evaluate2table2") as evaluate22table
                    view1.navigationItem.title = "评估表：\(id)"
                    evaluate22[0] = back.objectAtIndex(0)["firstnum"] as NSString
                    evaluate22[1] = back.objectAtIndex(0)["yearmonth"] as NSString
                    evaluate22[2] = back.objectAtIndex(0)["contact"] as NSString
                    evaluate22[3] = back.objectAtIndex(0)["contactphone"] as NSString
                    evaluate22[4] = back.objectAtIndex(0)["firstunit"] as NSString
                    evaluate22[5] = back.objectAtIndex(0)["secondunit"] as NSString
                    evaluate22[6] = back.objectAtIndex(0)["appraiser"] as NSString
                    evaluate22[7] = back.objectAtIndex(0)["belong"] as NSString
                    evaluate22[8] = back.objectAtIndex(0)["local"] as NSString
                    evaluate22[9] = back.objectAtIndex(0)["areaname"] as NSString
                    evaluate22[10] = back.objectAtIndex(0)["realdate"] as NSString
                    evaluate22[11] = back.objectAtIndex(0)["total"] as NSString
                    evaluate22[12] = back.objectAtIndex(0)["firstevaluate"] as NSString
                    evaluate22[13] = back.objectAtIndex(0)["firstsuggestion"] as NSString
                    evaluate22[14] = back.objectAtIndex(0)["secondsuggestion"] as NSString
                    evaluate22[15] = back.objectAtIndex(0)["reportnum"] as NSString
                    evaluate22[16] = back.objectAtIndex(0)["reportdate"] as NSString
                    evaluate22[17] = back.objectAtIndex(0)["reportstyle"] as NSString
                    
                    
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
