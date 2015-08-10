//
//  payView.swift
//  App
//
//  Created by 赵希帆 on 15/5/31.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class payView : UIViewController {
    
    @IBOutlet weak var pay: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        pay.keyboardType = UIKeyboardType.NumberPad
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func back(sender: AnyObject) {
        pay.resignFirstResponder()
    }
    @IBAction func submit(sender: AnyObject) {
        if(shenfen == 1)
        {
        liebiao1[25] = pay.text
        }
        else if (shenfen == 5)
        {
            money2[18] = pay.text
        }
        isSave = true
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
