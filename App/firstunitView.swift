//
//  firstunitView.swift
//  App
//
//  Created by 赵希帆 on 15/5/28.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class firstunitView: UIViewController {
    
    
    @IBOutlet weak var firstunit: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstunit.text = "其他"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func back(sender: AnyObject) {
        firstunit.resignFirstResponder()
    }
    @IBAction func submit(sender: AnyObject) {
        if(shenfen == 1)
        {
        liebiao1[6] = firstunit.text
        }
        else if (shenfen == 3)
        {
            salesman2[4] = firstunit.text
        }
        isSave = true
        self.navigationController?.popViewControllerAnimated(true)
    }
    

}
