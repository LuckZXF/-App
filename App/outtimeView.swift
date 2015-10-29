//
//  outtimeView.swift
//  App
//
//  Created by 赵希帆 on 15/5/29.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class outtimeView: UIViewController {
    
    @IBOutlet weak var outtime: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        outtime.keyboardType = UIKeyboardType.NumberPad
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func back(sender: AnyObject) {
        outtime.resignFirstResponder()
    }
    @IBAction func submit(sender: AnyObject) {
        if(shenfen == 1){
        liebiao1[15] = outtime.text!
        }
        else if(shenfen == 4)
        {
            appraiser2[13] = outtime.text!
        }
        isSave = true
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
