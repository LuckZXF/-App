//
//  localView.swift
//  App
//
//  Created by 赵希帆 on 15/5/29.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class localView: UIViewController {
    
    @IBOutlet weak var local: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func back(sender: AnyObject) {
        local.resignFirstResponder()
    }

    @IBAction func submit(sender: AnyObject) {
        if(shenfen == 1)
        {
        liebiao1[11] = local.text!
        }
        else if (shenfen == 3)
        {
            salesman2[9] = local.text!
        }
        else if(shenfen == 4)
        {
            appraiser2[9] = local.text!
        }
        isSave = true
        self.navigationController?.popViewControllerAnimated(true)
    }
}
