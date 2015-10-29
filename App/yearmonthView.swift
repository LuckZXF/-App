//
//  yearmonthView.swift
//  App
//
//  Created by 赵希帆 on 15/5/28.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class yearmonthView: UIViewController {
    
    @IBOutlet weak var yearmonth: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        yearmonth.keyboardType = UIKeyboardType.NumberPad
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func back(textField: UITextField!) {
        yearmonth.resignFirstResponder()
    }
    @IBAction func submit(sender: AnyObject) {
        if(shenfen == 1)
        {
        liebiao1[3] = yearmonth.text!
        }
        else if(shenfen == 3)
        {
            salesman2[1] = yearmonth.text!
        }
        isSave = true
        self.navigationController?.popViewControllerAnimated(true)
    }
}
