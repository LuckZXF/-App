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
        var number : String = search.text!
        var name : String = test2!
        var params : Dictionary<String,String> = ["firstnum" : number,"appraiser" : name]
        print(params)
        manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/search3", parameters: params, success: { (operation: AFHTTPRequestOperation!,
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
                var params : Dictionary<String,String> = ["firstnum" : number,"appraiser" : name]
                print(params)
                manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/search33", parameters: params, success: { (operation: AFHTTPRequestOperation!,
                    responseObject: AnyObject!) in
                    var back = responseObject as! NSMutableArray!
                    
                    var id : String = back.objectAtIndex(0)["id"] as! String
                    
                    //liebiao2 = back.objectAtIndex(0) as NSDictionary
                    
                    let view1 = self.storyboard?.instantiateViewControllerWithIdentifier("appraisertable2") as! appraisertable2
                   view1.navigationItem.title = "评估表：\(id)"
                    //liebiao2 = back.objectAtIndex(0) as NSDictionary
                    appraiser2[0] = back.objectAtIndex(0)["firstnum"] as! String
                    appraiser2[1] = back.objectAtIndex(0)["yearmonth"] as! String
                    appraiser2[2] = back.objectAtIndex(0)["contact"] as! String
                    appraiser2[3] = back.objectAtIndex(0)["contactphone"] as! String
                    appraiser2[4] = back.objectAtIndex(0)["firstunit"] as! String
                    appraiser2[5] = back.objectAtIndex(0)["secondunit"] as! String
                    appraiser2[6] = back.objectAtIndex(0)["thirdunit"] as! String
                    appraiser2[7] = back.objectAtIndex(0)["appraiser"] as! String
                    appraiser2[8] = back.objectAtIndex(0)["belong"] as! String
                    appraiser2[9] = back.objectAtIndex(0)["local"] as! String
                    appraiser2[10] = back.objectAtIndex(0)["firstremark"] as! String
                    appraiser2[11] = back.objectAtIndex(0)["areaname"] as! String
                    appraiser2[12] = back.objectAtIndex(0)["realdate"] as! String
                    appraiser2[13] = back.objectAtIndex(0)["outtime"] as! String
                    appraiser2[14] = back.objectAtIndex(0)["total"] as! String
                    appraiser2[15] = back.objectAtIndex(0)["firstevaluate"] as! String
                    appraiser2[16] = back.objectAtIndex(0)["firstsuggestion"] as! String
                    appraiser2[17] = back.objectAtIndex(0)["secondevaluate"] as! String
                    appraiser2[18] = back.objectAtIndex(0)["secondsuggestion"] as! String
                    appraiser2[19] = back.objectAtIndex(0)["reportnum"] as! String
                    appraiser2[20] = back.objectAtIndex(0)["reportdate"] as! String
                    appraiser2[21] = back.objectAtIndex(0)["reportstyle"] as! String
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
