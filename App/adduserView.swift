//
//  adduserView.swift
//  App
//
//  Created by 赵希帆 on 15/6/6.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class adduserView : UIViewController {
    
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var power: UITextField!
    var index : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        id.text = gmuserid[index]
        name.text = gmusername[index]
        password.text = gmuserpassword[index]
        phone.text = gmuserphone[index]
        email.text = gmuseremail[index]
        power.text = gmuserpower[index]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func back(sender: AnyObject) {
        id.resignFirstResponder()
        name.resignFirstResponder()
        password.resignFirstResponder()
        phone.resignFirstResponder()
        email.resignFirstResponder()
        power.resignFirstResponder()
    }
    @IBAction func submit(sender: AnyObject) {
        var userid : String! = id.text!
        var username : String! = name.text!
        var userphone : String! = phone.text!
        var userpassword : String!  = password.text!
        var useremail : String! = email.text!
        var userpower : String! = power.text!
        if(userid != "" && username != "" && userpassword != "" && userphone != "" && useremail != "" && userpower != "")
        {
        let manager = AFHTTPRequestOperationManager()
        var zxf : AFJSONRequestSerializer = AFJSONRequestSerializer()
        var fxz : AFJSONResponseSerializer = AFJSONResponseSerializer()
        manager.requestSerializer = zxf
        manager.responseSerializer = fxz
        //var name : String = test2!
        // var id : String = "\(mostpinggu)"
            var params : Dictionary<String,String> = ["userid" : userid, "username" : username, "userpassword" : userpassword, "userphone" : userphone, "useremail" : useremail, "userpower" : userpower]
        
        manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/adduser", parameters: params, success: { (operation: AFHTTPRequestOperation!,
            responseObject: AnyObject!) in
            //println("success")
            let responseDict = responseObject as! NSDictionary!
            var panduan : String = responseDict["success"] as! String
            if(panduan == "yes"){
                print("OK")
                add = true
                gmusername[0] = username
                gmuserid[0] = userid
                gmuserpassword[0] = userpassword
                gmuserphone[0] = userphone
                gmuseremail[0] = useremail
                gmuserpower[0] = userpower
               /* gmusername.insert(username, atIndex: 0)
                gmuserpower.insert(userpowr, atIndex: 0)
                gmuseremail.insert(useremail, atIndex: 0)
                gmuserid.insert(userid, atIndex: 0)
                gmuserpassword.insert(userpassword, atIndex: 0)
                gmuserphone.insert(userphone, atIndex: 0)*/
                self.navigationController?.popViewControllerAnimated(true)
                            }
            },
            failure: { (operation: AFHTTPRequestOperation!,
                error: NSError!) in
                //Handle Error
                print(error)
                print(operation.responseString)
        })
        }
        else{
            let alert =  UIAlertView()
            alert.title = "提示"
            alert.message = "请完善用户的所有信息"
            alert.addButtonWithTitle("ok")
            alert.show()
        }
    }
    
}
