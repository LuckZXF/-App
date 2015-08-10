//
//  totalView.swift
//  App
//
//  Created by 赵希帆 on 15/5/30.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class totalView: UIViewController {
    
    @IBOutlet weak var total: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        total.keyboardType = UIKeyboardType.NumberPad
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func back(sender: AnyObject) {
        total.resignFirstResponder()
    }
    
    @IBAction func submit(sender: AnyObject) {
        if(shenfen == 1)
        {
        liebiao1[16] = total.text
        }
        else if (shenfen == 5)
        {
            money2[10] = total.text
        }
        else if(shenfen == 6)
        {
            writing2[7] = total.text
        }
        isSave = true
        self.navigationController?.popViewControllerAnimated(true)
    }
}
