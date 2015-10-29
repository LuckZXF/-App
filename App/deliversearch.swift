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
        var number : String = search.text!
        var name : String = test2!
        var params : Dictionary<String,String> = ["firstnum" : number,"deliver" : name]
        print(params)
        manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/search1", parameters: params, success: { (operation: AFHTTPRequestOperation!,
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
                var params : Dictionary<String,String> = ["firstnum" : number,"deliver" : name]
                print(params)
                manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/search11", parameters: params, success: { (operation: AFHTTPRequestOperation!,
                    responseObject: AnyObject!) in
                        var back = responseObject as! NSMutableArray!
                    let view1 = self.storyboard?.instantiateViewControllerWithIdentifier("Delivertable") as! delivertable
                    var id : String = back.objectAtIndex(0)["id"] as! String
                    view1.navigationItem.title = "评估表：\(id)"
                    //liebiao2 = back.objectAtIndex(0) as NSDictionary
                    liebiao1[0] = back.objectAtIndex(0)["deliver"] as! String
                    liebiao1[1] = back.objectAtIndex(0)["salesman"] as! String
                    liebiao1[2] = back.objectAtIndex(0)["firstnum"] as! String
                    liebiao1[3] = back.objectAtIndex(0)["yearmonth"] as! String
                    liebiao1[4] = back.objectAtIndex(0)["contact"] as! String
                    liebiao1[5] = back.objectAtIndex(0)["contactphone"] as! String
                    liebiao1[6] = back.objectAtIndex(0)["firstunit"] as! String
                    liebiao1[7] = back.objectAtIndex(0)["secondunit"] as! String
                    liebiao1[8] = back.objectAtIndex(0)["thirdunit"] as! String
                    liebiao1[9] = back.objectAtIndex(0)["appraiser"] as! String
                    liebiao1[10] = back.objectAtIndex(0)["belong"] as! String
                    liebiao1[11] = back.objectAtIndex(0)["local"] as! String
                    liebiao1[12] = back.objectAtIndex(0)["firstremark"] as! String
                    liebiao1[13] = back.objectAtIndex(0)["areaname"] as! String
                    liebiao1[14] = back.objectAtIndex(0)["realdate"] as! String
                    liebiao1[15] = back.objectAtIndex(0)["outtime"] as! String
                    liebiao1[16] = back.objectAtIndex(0)["total"] as! String
                    liebiao1[17] = back.objectAtIndex(0)["firstevaluate"] as! String
                    liebiao1[18] = back.objectAtIndex(0)["firstsuggestion"] as! String
                    liebiao1[19] = back.objectAtIndex(0)["secondevaluate"] as! String
                    liebiao1[20] = back.objectAtIndex(0)["secondsuggestion"] as! String
                    liebiao1[21] = back.objectAtIndex(0)["reportnum"] as! String
                    liebiao1[22] = back.objectAtIndex(0)["reportdate"] as! String
                    liebiao1[23] = back.objectAtIndex(0)["reportstyle"] as! String
                    liebiao1[24] = back.objectAtIndex(0)["secondremark"] as! String
                    liebiao1[25] = back.objectAtIndex(0)["pay"] as! String
                    liebiao1[26] = back.objectAtIndex(0)["thirdremark"] as! String
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
