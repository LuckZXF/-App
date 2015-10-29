//
//  dateViewContorller.swift
//  App
//
//  Created by 赵希帆 on 15/5/9.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class dateViewController : UIViewController {
    var datePicker : UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        //显示当前选中的日期label
        if(shenfen == 1)
        {
        datelabel.text = liebiao1[14]
        }
        else if(shenfen == 4)
        {
            datelabel.text = appraiser2[12]
        }
        //定义一个显示activityIndicatorView的按钮
        let button1 = UIButton(type: UIButtonType.System) as UIButton
        
        button1.frame = CGRectMake(self.view.frame.width/2-200, 200, 400, 50)
        button1.setTitle("回到当前日期", forState: UIControlState.Normal)
        button1.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button1.tag = 1
        //定义一个隐藏activityIndicatorView
        let button2 = UIButton(type: UIButtonType.System) as UIButton
        button2.frame = CGRectMake(self.view.frame.width/2-200, 250, 400, 50)
        button2.setTitle("选中该日期", forState: UIControlState.Normal)
        button2.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button2.tag = 2
        //初始化datePicker
        datePicker = UIDatePicker(frame: CGRectMake(0, self.view.frame.height - 350, self.view.frame.width, 300))
        datePicker.datePickerMode = UIDatePickerMode.DateAndTime
        datePicker.minuteInterval = 1
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let maxDate = dateFormatter.dateFromString("2099-08-01 08:00:00")
        let minDate = dateFormatter.dateFromString("1999-03-01 08:00:00")
        datePicker.maximumDate = maxDate
        datePicker.minimumDate = minDate
        datePicker.date = NSDate()
        datePicker.addTarget(self, action: Selector("datePickerValueChange:"), forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(button1)
        self.view.addSubview(button2)
        self.view.addSubview(datePicker)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBOutlet weak var datelabel: UILabel!
    func buttonAction(sender : UIButton) {
        let num = sender.tag
        switch num {
        case 1:
            datePicker.setDate(NSDate(), animated: true)
        case 2:
           // println("当前日期:\(datePicker.date)")
            if(shenfen == 1)
            {
            liebiao1[14] = "\(datePicker.date)"
            datelabel.text = liebiao1[14]
            }
            else if(shenfen == 4)
            {
                appraiser2[12] = "\(datePicker.date)"
                datelabel.text = appraiser2[12]
            }
            isSave = true
        default:
            break
        }
    }
    func datePickerValueChange(sender: UIDatePicker) {
        print("date select:\(sender.date)")
    }
}