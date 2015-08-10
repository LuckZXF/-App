//
//  ViewController.swift
//  App
//
//  Created by 赵希帆 on 15/4/7.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIAlertViewDelegate {

    
    @IBOutlet weak var Userid: UITextField!
    
    @IBOutlet weak var Userpwd: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginAction(sender: AnyObject) {
        var windows = Array<UIWindow!>()
        let rv = UIApplication.sharedApplication().keyWindow?.subviews.first as UIView
        let frame = CGRectMake(0, 0, 78, 78)
        let window = UIWindow(frame: frame)
        let mainView = UIView(frame: frame)
        mainView.layer.cornerRadius = 12
        mainView.backgroundColor = UIColor(red:0, green:0, blue:0, alpha: 0.8)
        
        let ai = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        ai.frame = CGRectMake(21, 21, 36, 36)
        ai.startAnimating()
        mainView.addSubview(ai)
        
        window.windowLevel = UIWindowLevelAlert
        window.center = rv.center
        window.hidden = false
        window.addSubview(mainView)
        windows.append(window)
        let manager = AFHTTPRequestOperationManager()
        var zxf : AFJSONRequestSerializer = AFJSONRequestSerializer()
        var fxz : AFJSONResponseSerializer = AFJSONResponseSerializer()
        manager.requestSerializer = zxf
        manager.responseSerializer = fxz
        var userid : String = Userid.text
        var userpwd : String = Userpwd.text
        
        var params : Dictionary<String,String> = ["userid" : userid, "userpassword" : userpwd]
        print(params)
        manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/exist", parameters: params, success: { (operation: AFHTTPRequestOperation!,
            responseObject: AnyObject!) in
            
            let responseDict1 = responseObject as NSDictionary!
            var exist : String
            
            exist = responseDict1["1"] as NSString
            if(exist == "yes")
            {
                let manager = AFHTTPRequestOperationManager()
                var zxf : AFJSONRequestSerializer = AFJSONRequestSerializer()
                var fxz : AFJSONResponseSerializer = AFJSONResponseSerializer()
                manager.requestSerializer = zxf
                manager.responseSerializer = fxz

        manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/get1", parameters: nil, success: { (operation: AFHTTPRequestOperation!,
                    responseObject: AnyObject!) in
        var get : NSMutableArray
            println("ooookkkk")
        get = responseObject as NSMutableArray
            println("ooookkkk")
        var num : Int = 0
        while(num<get.count)
        {
            var s : String
            s = get.objectAtIndex(num)["userpower"] as NSString
            var p : String
            p = get.objectAtIndex(num)["username"] as NSString
            if(s == "业务员")
            {
                salesman.append(p)
            }
            else if(s == "评估员")
            {
                appraiser.append(p)
            }
            else if(s == "一级审核估价师")
            {
                firstevaluate.append(p)
            }
            else if(s == "二级审核估价师")
            {
               secondvaluate.append(p)
            }
            num++
        }
        },
        failure: { (operation: AFHTTPRequestOperation!,
            error: NSError!) in
            //Handle Error
            println(error)
            println(operation.responseString)
     })
        var params : Dictionary<String,String> = ["userid" : userid, "userpassword" : userpwd]
        manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/hello", parameters: params, success: { (operation: AFHTTPRequestOperation!,
            responseObject: AnyObject!) in
            println("success")
            let responseDict = responseObject as NSDictionary!
             test = responseDict["userpassword"] as NSString
            test3  = responseDict["userpower"] as NSString
             test2  = responseDict["username"] as NSString
            test4  = responseDict["userphone"] as NSString
             test5 = responseDict["useremail"] as NSString
            test0 = userid
          //  print(userpower)
            if (test == userpwd)
            {
                if(test3 == "派单员")
                {
                    shenfen = 1
                    //println("1111")
                    let manager = AFHTTPRequestOperationManager()
                    var zxf : AFJSONRequestSerializer = AFJSONRequestSerializer()
                    var fxz : AFJSONResponseSerializer = AFJSONResponseSerializer()
                    manager.requestSerializer = zxf
                    manager.responseSerializer = fxz
                    var name : String = test2!
                    var params : Dictionary<String,String> = ["deliver" : name]
                    
                    manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/hi", parameters: params, success: { (operation: AFHTTPRequestOperation!,
                        responseObject: AnyObject!) in
                        //println("success")
                         count1 = responseObject as NSMutableArray!
                        //print(responseObject)
                       
                        // let responseDict = responseObject as NSDictionary!
                       // count1 = responseDict[0] as NSMutableArray
                        
                        var num : Int = 0
                        mostpinggu = 0
                       
                        while(num < count1?.count){
                            var s : String
                            var p : String
                            s = count1?.objectAtIndex(num)["id"] as NSString
                            p = count1?.objectAtIndex(num)["yearmonth"] as NSString
                            var ss : Int! = s.toInt()
                            
                            if(p == "201506")
                            {
                            pinggu.append(s) //= count1?.objectAtIndex(num)["id"] as NSString
                            count11++
                            println(count11)
                            }
                            
                            num++
                           // println("1111")
                        }
                       
                        },
                        failure: { (operation: AFHTTPRequestOperation!,
                            error: NSError!) in
                            //Handle Error
                            println(error)
                            println(operation.responseString)
                    })

                var view1 = self.storyboard?.instantiateViewControllerWithIdentifier("loginsuccess") as UITabBarController
                var view = self.storyboard?.instantiateViewControllerWithIdentifier("firstView") as firstView
                view1.viewDidLoad()
                
                    for i in windows {
                        i.hidden = true
                    }
                self.presentViewController(view1 , animated: true, completion: nil)
                }
                else if (test3 == "系统管理员")
                {
                    shenfen = 2
                    let manager = AFHTTPRequestOperationManager()
                    var zxf : AFJSONRequestSerializer = AFJSONRequestSerializer()
                    var fxz : AFJSONResponseSerializer = AFJSONResponseSerializer()
                    manager.requestSerializer = zxf
                    manager.responseSerializer = fxz
                    var name : String = test2!
                    var params : Dictionary<String,String> = ["gm" : "1"]
                    
                    manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/users", parameters: params, success: { (operation: AFHTTPRequestOperation!,
                        responseObject: AnyObject!) in
                        count2 = responseObject as NSMutableArray!
                        var num1 : Int = 0
                        println("zxf")
                        while(num1<count2?.count)
                        {
                            //println(count2?.count)
                           // print(num1)
                            gmusername.append(count2?.objectAtIndex(num1)["username"] as NSString)
                            gmuserpower.append(count2?.objectAtIndex(num1)["userpower"] as NSString)
                            gmuserpassword.append(count2?.objectAtIndex(num1)["userpassword"] as NSString)
                            gmuserid.append(count2?.objectAtIndex(num1)["userid"] as NSString)
                            gmuseremail.append(count2?.objectAtIndex(num1)["useremail"] as NSString)
                            gmuserphone.append(count2?.objectAtIndex(num1)["userphone"] as NSString)
                                                       // println(gmusername[num1])
                            num1++
                        }
                        },
                        failure: { (operation: AFHTTPRequestOperation!,
                            error: NSError!) in
                            //Handle Error
                            println(error)
                            println(operation.responseString)
                    })
                    let view = self.storyboard?.instantiateViewControllerWithIdentifier("gm") as UITabBarController
                    self.presentViewController(view, animated: true, completion: nil)
                    
                }
                else if(test3 == "业务员")
                {
                    shenfen = 3
                    let manager = AFHTTPRequestOperationManager()
                    var zxf : AFJSONRequestSerializer = AFJSONRequestSerializer()
                    var fxz : AFJSONResponseSerializer = AFJSONResponseSerializer()
                    manager.requestSerializer = zxf
                    manager.responseSerializer = fxz
                    var name : String = test2!
                    var params : Dictionary<String,String> = ["salesman" : name]
                    manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/hi3", parameters: params, success: { (operation: AFHTTPRequestOperation!,
                        responseObject: AnyObject!) in
                        //println("success")
                        count3 = responseObject as NSMutableArray!
                        var num : Int = 0
                       // mostpinggu = 0
                       // println("123456")
                        while(num < count3?.count){
                            var s : String
                            var p : String
                            s = count3?.objectAtIndex(num)["id"] as NSString
                            p = count3?.objectAtIndex(num)["yearmonth"] as NSString
                            var ss : Int! = s.toInt()
                            if (ss >= mostpinggu)
                            {
                                mostpinggu = ss
                                //println("1111")
                            }
                            if(p == "201506")
                            {
                                pinggu.append(s) //= count1?.objectAtIndex(num)["id"] as NSString
                                count33++
                                println(count33)
                            } //= count1?.objectAtIndex(num)["id"] as NSString
                            num++
                           //  println("1111")
                        }

                        },
                        failure: { (operation: AFHTTPRequestOperation!,
                            error: NSError!) in
                            //Handle Error
                            println(error)
                            println(operation.responseString)
                    })
                    let view = self.storyboard?.instantiateViewControllerWithIdentifier("salesmantabbar") as UITabBarController
                    self.presentViewController(view , animated: true, completion: nil)
                }
                else if(test3 == "评估员")
                {
                    shenfen = 4
                    let manager = AFHTTPRequestOperationManager()
                    var zxf : AFJSONRequestSerializer = AFJSONRequestSerializer()
                    var fxz : AFJSONResponseSerializer = AFJSONResponseSerializer()
                    manager.requestSerializer = zxf
                    manager.responseSerializer = fxz
                    var name : String = test2!
                    var params : Dictionary<String,String> = ["appraiser" : name]
                    manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/hi4", parameters: params, success: { (operation: AFHTTPRequestOperation!,
                        responseObject: AnyObject!) in
                        //println("success")
                        count4 = responseObject as NSMutableArray!
                        var num : Int = 0
                        // mostpinggu = 0
                         println("123456")
                        while(num < count4?.count){
                            var s : String
                            var p : String
                            s = count4?.objectAtIndex(num)["id"] as NSString
                            p = count4?.objectAtIndex(num)["yearmonth"] as NSString
                            var ss : Int! = s.toInt()
                            if (ss >= mostpinggu)
                            {
                                mostpinggu = ss
                                //println("1111")
                            }
                            if(p == "201506")
                            {
                                pinggu.append(s) //= count1?.objectAtIndex(num)["id"] as NSString
                                count44++
                                println(count44)
                            }
                            num++
                            //  println("1111")
                        }
                        
                        },
                        failure: { (operation: AFHTTPRequestOperation!,
                            error: NSError!) in
                            //Handle Error
                            println(error)
                            println(operation.responseString)
                    })
                    let view = self.storyboard?.instantiateViewControllerWithIdentifier("appraisertabbar") as UITabBarController
                    self.presentViewController(view , animated: true, completion: nil)
                }
                else if(test3 == "财务员")
                {
                    shenfen = 5
                    let manager = AFHTTPRequestOperationManager()
                    var zxf : AFJSONRequestSerializer = AFJSONRequestSerializer()
                    var fxz : AFJSONResponseSerializer = AFJSONResponseSerializer()
                    manager.requestSerializer = zxf
                    manager.responseSerializer = fxz
                    var name : String = test2!
                   // var params : Dictionary<String,String> = ["appraiser" : name]
                    manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/hi5", parameters: nil, success: { (operation: AFHTTPRequestOperation!,
                        responseObject: AnyObject!) in
                        //println("success")
                        count5 = responseObject as! NSMutableArray!
                        var num : Int = 0
                        // mostpinggu = 0
                        println("123456")
                        while(num < count5?.count){
                            var s : String
                            var p : String
                            s = count5?.objectAtIndex(num)["id"] as NSString
                            p = count5?.objectAtIndex(num)["yearmonth"] as NSString
                            var ss : Int! = s.toInt()
                            if (ss >= mostpinggu)
                            {
                                mostpinggu = ss
                                //println("1111")
                            }
                            if(p == "201506")
                            {
                                pinggu.append(s) //= count1?.objectAtIndex(num)["id"] as NSString
                                count55++
                                println(count55)
                            }
                            //= count1?.objectAtIndex(num)["id"] as NSString
                            num++
                            //  println("1111")
                        }
                        
                        },
                        failure: { (operation: AFHTTPRequestOperation!,
                            error: NSError!) in
                            //Handle Error
                            println(error)
                            println(operation.responseString)
                    })
                    let view = self.storyboard?.instantiateViewControllerWithIdentifier("moneyView") as UITabBarController
                    self.presentViewController(view , animated: true, completion: nil)
                }
                else if(test3 == "文员")
                {
                    shenfen = 6
                    let manager = AFHTTPRequestOperationManager()
                    var zxf : AFJSONRequestSerializer = AFJSONRequestSerializer()
                    var fxz : AFJSONResponseSerializer = AFJSONResponseSerializer()
                    manager.requestSerializer = zxf
                    manager.responseSerializer = fxz
                    var name : String = test2!
                    // var params : Dictionary<String,String> = ["appraiser" : name]
                    manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/hi5", parameters: nil, success: { (operation: AFHTTPRequestOperation!,
                        responseObject: AnyObject!) in
                        //println("success")
                        count6 = responseObject as NSMutableArray!
                        var num : Int = 0
                        // mostpinggu = 0
                        println("123456")
                        while(num < count6?.count){
                            var s : String
                            var p : String
                            s = count6?.objectAtIndex(num)["id"] as NSString
                            p = count6?.objectAtIndex(num)["yearmonth"] as NSString
                            var ss : Int! = s.toInt()
                            if (ss >= mostpinggu)
                            {
                                mostpinggu = ss
                                //println("1111")
                            }
                            if(p == "201506")
                            {
                                pinggu.append(s) //= count1?.objectAtIndex(num)["id"] as NSString
                                count66++
                                println(count66)
                            }
                            //= count1?.objectAtIndex(num)["id"] as NSString
                            num++
                            //  println("1111")
                        }
                        
                        },
                        failure: { (operation: AFHTTPRequestOperation!,
                            error: NSError!) in
                            //Handle Error
                            println(error)
                            println(operation.responseString)
                    })
                    let view = self.storyboard?.instantiateViewControllerWithIdentifier("writingView") as UITabBarController
                    self.presentViewController(view , animated: true, completion: nil)
                }
                else if(test3 == "一级审核估价师")
                {
                    println("qqq")
                    shenfen = 7
                    let manager = AFHTTPRequestOperationManager()
                    var zxf : AFJSONRequestSerializer = AFJSONRequestSerializer()
                    var fxz : AFJSONResponseSerializer = AFJSONResponseSerializer()
                    manager.requestSerializer = zxf
                    manager.responseSerializer = fxz
                    var name : String = test2!
                    var params : Dictionary<String,String> = ["firstevaluate" : name]
                    manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/hi6", parameters: params, success: { (operation: AFHTTPRequestOperation!,
                        responseObject: AnyObject!) in
                        //println("success")
                        count7 = responseObject as NSMutableArray!
                        var num : Int = 0
                        // mostpinggu = 0
                         println("123456")
                        while(num < count7?.count){
                            var s : String
                            var p : String
                            s = count7?.objectAtIndex(num)["id"] as NSString
                            p = count7?.objectAtIndex(num)["yearmonth"] as NSString
                            var ss : Int! = s.toInt()
                            if (ss >= mostpinggu)
                            {
                                mostpinggu = ss
                                //println("1111")
                            }
                            if(p == "201506")
                            {
                                pinggu.append(s) //= count1?.objectAtIndex(num)["id"] as NSString
                                count77++
                                println(count77)
                            }
                            num++
                            //  println("1111")
                        }
                        
                        },
                        failure: { (operation: AFHTTPRequestOperation!,
                            error: NSError!) in
                            //Handle Error
                            println(error)
                            println(operation.responseString)
                    })
                    let view = self.storyboard?.instantiateViewControllerWithIdentifier("evaluate1") as UITabBarController
                    self.presentViewController(view , animated: true, completion: nil)
                }
                else if(test3 == "二级审核估价师")
                {
                    println("sss")
                    shenfen = 8
                    let manager = AFHTTPRequestOperationManager()
                    var zxf : AFJSONRequestSerializer = AFJSONRequestSerializer()
                    var fxz : AFJSONResponseSerializer = AFJSONResponseSerializer()
                    manager.requestSerializer = zxf
                    manager.responseSerializer = fxz
                    var name : String = test2!
                    var params : Dictionary<String,String> = ["secondevaluate" : name]
                    println(params)
                    manager.POST("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/hi8", parameters: params, success: { (operation: AFHTTPRequestOperation!,
                        responseObject: AnyObject!) in
                        println("success")
                        count9 = responseObject as NSMutableArray!
                        var num : Int = 0
                        // mostpinggu = 0
                         println("123456")
                        while(num < count9?.count){
                            var s : String
                            var p : String
                            s = count9?.objectAtIndex(num)["id"] as NSString
                            p = count9?.objectAtIndex(num)["yearmonth"] as NSString
                            var ss : Int! = s.toInt()
                            if (ss >= mostpinggu)
                            {
                                mostpinggu = ss
                                //println("1111")
                            }
                            if(p == "201506")
                            {
                                pinggu.append(s) //= count1?.objectAtIndex(num)["id"] as NSString
                                count99++
                                println(count99)
                            }
                            num++
                            //  println("1111")
                        }
                        
                        },
                        failure: { (operation: AFHTTPRequestOperation!,
                            error: NSError!) in
                            //Handle Error
                            println(error)
                            println(operation.responseString)
                    })
                    let view = self.storyboard?.instantiateViewControllerWithIdentifier("evaluate2") as UITabBarController
                    self.presentViewController(view , animated: true, completion: nil)
                }
            }
            else
            {
                let alert = UIAlertView()
                alert.title = "提示"
                alert.message = "账号密码有误"
                alert.addButtonWithTitle("ok")
                alert.show()
            }
            
            }, failure: { (operation: AFHTTPRequestOperation!,
                error: NSError!) in
                //Handle Error
                println(error)
                println(operation.responseString)
        })
            }
        else
                {
                    let alert = UIAlertView()
                    alert.title = "提示"
                    alert.message = "账号不存在"
                    alert.addButtonWithTitle("ok")
                    alert.show()
                    println("222")
                }
            }, failure: { (operation: AFHTTPRequestOperation!,
                error: NSError!) in
                //Handle Error
                println(error)
                println(operation.responseString)
            })
        
   
       /* manager.p("http://www.zhaoxifan.sinaapp.com/index.php/Home/Index/hello",
            parameters: params,
            success: { (operation: AFHTTPRequestOperation!,
                responseObject: AnyObject!) in
                
                let responseDict = responseObject as NSDictionary!
                print("dddd")
            },
            failure: { (operation: AFHTTPRequestOperation!,
                error: NSError!) in
                //Handle Error
                print("wwww")
        })*/
    }
    @IBAction func textfieldReturn(textField: UITextField!) {
        Userid.resignFirstResponder()
        Userpwd.resignFirstResponder()
       
    }
   // func textFieldShouldReturn(textField: UITextField!) -> Bool
   // {
   //     textField.resignFirstResponder()
   //     return true;
   // }
}

