//
//  areanameView.swift
//  App
//
//  Created by 赵希帆 on 15/5/29.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class areanameView: UIViewController {
    
    @IBOutlet weak var areaname: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       // areaname.keyboardType = UIKeyboardType.NumberPad
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func back(sender: AnyObject) {
        areaname.resignFirstResponder()
    }
    @IBAction func submit(sender: AnyObject) {
        if(shenfen == 1)
        {
        liebiao1[13] = areaname.text!
        }
        else if(shenfen == 3)
        {
            salesman2[11] = areaname.text!
        }
        else if(shenfen == 4)
        {
            appraiser2[11] = areaname.text!
        }
        isSave = true
        self.navigationController?.popViewControllerAnimated(true)
    }
   
}
