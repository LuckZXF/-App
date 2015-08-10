//
//  thirdunitView.swift
//  App
//
//  Created by 赵希帆 on 15/5/29.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class thirdunitView: UIViewController {
    
    //@IBOutlet weak var thirdunit: UITextField!
    @IBOutlet weak var thirdunit: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        thirdunit.text = "其他"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func back(sender: AnyObject) {
        thirdunit.resignFirstResponder()
    }
    @IBAction func submit(sender: AnyObject) {
        if(shenfen == 1)
        {
        liebiao1[8] = thirdunit.text
        }
        else if (shenfen == 3)
        {
            salesman2[6] = thirdunit.text
        }
        isSave = true
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
}
