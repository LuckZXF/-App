//
//  belongView.swift
//  App
//
//  Created by 赵希帆 on 15/5/29.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class belongView: UIViewController {
    
    @IBOutlet weak var belong: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func back(sender: AnyObject) {
        belong.resignFirstResponder()
    }
    @IBAction func submit(sender: AnyObject) {
        if(shenfen == 1)
        {
        liebiao1[10] = belong.text
        }
        else if(shenfen == 3)
        {
            salesman2[8] = belong.text
        }
        isSave = true
        self.navigationController?.popViewControllerAnimated(true)
    }
}
