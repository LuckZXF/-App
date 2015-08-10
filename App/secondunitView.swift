//
//  secondunitView.swift
//  App
//
//  Created by 赵希帆 on 15/5/29.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class secondunitView: UIViewController {
    
    @IBOutlet weak var secondunit: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        secondunit.text = "其他"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func back(sender: AnyObject) {
        secondunit.resignFirstResponder()
    }
    @IBAction func submit(sender: AnyObject) {
        if(shenfen == 1)
        {
        liebiao1[7] = secondunit.text
        }
        else if (shenfen == 3)
        {
            salesman2[5] = secondunit.text
        }
        isSave = true
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
