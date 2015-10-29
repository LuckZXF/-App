//
//  firstView.swift
//  App
//
//  Created by 赵希帆 on 15/4/15.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//


import UIKit;


class firstView :  UIViewController , UIAlertViewDelegate {
  
    
      var username : String = test2!
      var userpassword : String = test!
      var userphone : String = test4!
      var useremail : String = test5!
      var userpower : String = test3!
   
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var power: UILabel!
    
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    //@IBOutlet weak var phone: UILabel!
   // @IBOutlet weak var email: UILabel!
   // @IBOutlet weak var password: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
      //   Do any additional setup after loading the view, typically from a nib.
        name.text = username
        phone.text = userphone
        email.text = useremail
        power.text = userpower
       password.text = "******"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func cancel(textField: UITextField) {
        phone.resignFirstResponder()
        email.resignFirstResponder()
        password.resignFirstResponder()
    }
    
    @IBAction func exit(sender : AnyObject)
    {
        test = nil
        test0 = nil
        test2 = nil
        test3 = nil
        test4 = nil
        test5 = nil
        count1 = nil
        mostpinggu = 0
        isSave = false
        liebiao1.removeAll(keepCapacity: true)
        liebiao.removeAll(keepCapacity: true)
        count1?.removeAllObjects()
        pinggu.removeAll(keepCapacity: true)
        salesman.removeAll(keepCapacity: true)
        appraiser.removeAll(keepCapacity: true)
        firstevaluate.removeAll(keepCapacity: true)
        secondvaluate.removeAll(keepCapacity: true)
        var view = self.storyboard?.instantiateViewControllerWithIdentifier("ClientLogin") as! ViewController
        self.presentViewController(view, animated: true, completion: nil)
    

    }
   
    //显示密码
    @IBAction func showpassword(button : UIButton) {
        if(password.text == "******")
        {
            password.text = test
            button.setTitle("隐藏", forState: UIControlState.Normal)
        }
        else
        {
            password.text = "******"
            button.setTitle("显示", forState: UIControlState.Normal)
        }
        
    }
    //更改个人信息
    @IBAction func changemessage(sender: AnyObject) {
        if((password.text) != "" && (phone.text) != "" && (email.text) != "")
        {
            if((password.text) != "******")
            {
        let manager = AFHTTPRequestOperationManager()
        var zxf : AFJSONRequestSerializer = AFJSONRequestSerializer()
        var fxz : AFJSONResponseSerializer = AFJSONResponseSerializer()
        manager.requestSerializer = zxf
        manager.responseSerializer = fxz
        var userphone : String = phone.text!
        var useremail : String = email.text!
        var userpassword : String = password.text!
        var username : String = name.text!
        var userpower : String = power.text!
        var userid : String = test0!
        var params : Dictionary<String,String> = ["userid" : userid, "username" : username, "userpassword" : userpassword, "userphone" : userphone, "useremail" : useremail, "userpower" : userpower]
       // print(params)
        manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/update", parameters: params, success: { (operation: AFHTTPRequestOperation!,
            responseObject: AnyObject!) in
            //println("success")
            let responseDict = responseObject as! NSDictionary!
            var panduan : String = responseDict["success"] as! String
            if(panduan == "yes"){
                test = self.password.text
                test4 = self.phone.text
                test5 = self.email.text
                //print("sss")
                var view = self.storyboard?.instantiateViewControllerWithIdentifier("changeMessage") as! changeMessage
                self.presentViewController(view, animated: true, completion: nil)
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
                let alert = UIAlertView()
                alert.title = "警告"
                alert.message = "您的密码格式有误"
                alert.addButtonWithTitle("ok")
                alert.show()
            }
        }
        else
        {
            let alert = UIAlertView()
            alert.title = "警告"
            alert.message = "必填项目不能为空"
            alert.addButtonWithTitle("ok")
            alert.show()
        }
    }
}