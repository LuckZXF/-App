//
//  cource.swift
//  App
//
//  Created by 赵希帆 on 15/10/6.
//  Copyright © 2015年 赵希帆. All rights reserved.
//

import UIKit

class courcecheck : UIViewController , UIAlertViewDelegate {
    
    @IBOutlet weak var stuid: UITextField!
    @IBOutlet weak var passwd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func check(sender: AnyObject) {
        let manager = AFHTTPRequestOperationManager()
        let zxf : AFJSONRequestSerializer = AFJSONRequestSerializer()
        let fxz : AFJSONResponseSerializer = AFJSONResponseSerializer()
        manager.requestSerializer = zxf
        manager.responseSerializer = fxz
       // var studentid : String = stuid.text!
       // let userpwd : String = passwd.text!
        let params : Dictionary<String,String> = ["stu_id" : stuid.text! , "stu_name" : passwd.text!]
        manager.GET("http://www.szucal.com/api/1204/schedule.php?", parameters: params, success: {
            (operation: AFHTTPRequestOperation!,
            responseObject: AnyObject!) in
            let responseDict = responseObject as! NSDictionary!
          //  print(responseDict)
            let schedule = responseDict["schedule"] as! NSArray
            let courses = schedule[1] as! NSDictionary
            let zxf = courses["courses"] as! NSArray
            let fxz = zxf[0]["course_name"] as! String
            let alert = UIAlertView()
            alert.title = "明天课程"
            alert.message = fxz
            alert.addButtonWithTitle("ok")
            alert.show()
            print(fxz)

            }, failure: {(operation: AFHTTPRequestOperation!,
                error: NSError!) in
            //Handle Error
            print(error)
            print(operation.responseString)
    })
    /*    let params : Dictionary<String,String> = ["stu_id" : "2012150030"  , "stu_name" : "赵希帆"]
    //    print(params, terminator: "")
        manager.POST("http://www.szucal.com/api/1204/schedule.php", parameters: params, success: { (operation: AFHTTPRequestOperation!,
            responseObject: AnyObject!) in
                let responseDict = responseObject as! NSDictionary!
                print(responseDict)
            },
            failure: { (operation: AFHTTPRequestOperation!,
                error: NSError!) in
                //Handle Error
                print(error)
                print(operation.responseString)
            })*/
        
    }
}
