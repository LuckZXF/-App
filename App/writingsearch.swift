//
//  salesmansearch.swift
//  App
//
//  Created by 赵希帆 on 15/6/15.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class writingsearch : UIViewController,UIAlertViewDelegate{
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
        var number : String = search.text!
        var name : String = test2!
        var params : Dictionary<String,String> = ["firstnum" : number]
        print(params)
        manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/search4", parameters: params, success: { (operation: AFHTTPRequestOperation!,
            responseObject: AnyObject!) in
            //println("success")
            var back1 = responseObject as! NSDictionary!
            var panduan : String = back1["result"] as! String
            
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
                print(params)
                manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/search44", parameters: params, success: { (operation: AFHTTPRequestOperation!,
                    responseObject: AnyObject!) in
                    var back = responseObject as! NSMutableArray!
                    
                    var id : String = back.objectAtIndex(0)["id"] as! String
                    
                    //liebiao2 = back.objectAtIndex(0) as NSDictionary
                    
                    //liebiao2 = back.objectAtIndex(0) as NSDictionary
                    let view1 = self.storyboard?.instantiateViewControllerWithIdentifier("writingtable2") as! writingtable2
                    view1.navigationItem.title = "评估表：\(id)"                    //liebiao2 = back.objectAtIndex(0) as NSDictionary
                    writing2[0] = back.objectAtIndex(0)["firstnum"] as! String
                    writing2[1] = back.objectAtIndex(0)["yearmonth"] as! String
                    writing2[2] = back.objectAtIndex(0)["contact"] as! String
                    writing2[3] = back.objectAtIndex(0)["contactphone"] as! String
                    writing2[4] = back.objectAtIndex(0)["appraiser"] as! String
                    writing2[5] = back.objectAtIndex(0)["belong"] as! String
                    writing2[6] = back.objectAtIndex(0)["local"] as! String
                    writing2[7] = back.objectAtIndex(0)["total"] as! String
                    writing2[8] = back.objectAtIndex(0)["firstevaluate"] as! String
                    writing2[9] = back.objectAtIndex(0)["firstsuggestion"] as! String
                    writing2[10] = back.objectAtIndex(0)["secondevaluate"] as! String
                    writing2[11] = back.objectAtIndex(0)["secondsuggestion"] as! String
                    writing2[12] = back.objectAtIndex(0)["reportnum"] as! String
                    writing2[13] = back.objectAtIndex(0)["reportdate"] as! String
                    writing2[14] = back.objectAtIndex(0)["reportstyle"] as! String
                    writing2[15] = back.objectAtIndex(0)["secondremark"] as! String
                    
                    deliverwho = back.objectAtIndex(0)["deliver"] as! String
                    deliverwhoid = back.objectAtIndex(0)["id"] as! String
                    self.navigationController?.pushViewController(view1, animated: true)

                    
                    
                    
                    
                    },
                    failure: { (operation: AFHTTPRequestOperation!,
                        error: NSError!) in
                        //Handle Error
                        print(error)
                        print(operation.responseString)
                })
                
            }
            
            
            },
            failure: { (operation: AFHTTPRequestOperation!,
                error: NSError!) in
                //Handle Error
                print(error)
                print(operation.responseString)
        })
        
    }
    @IBAction func back(sender: AnyObject) {
        search.resignFirstResponder()
    }
    
}
