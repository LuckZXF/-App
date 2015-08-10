//
//  reportnumView.swift
//  App
//
//  Created by 赵希帆 on 15/5/31.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class reportnumView : UIViewController {
    
    @IBOutlet weak var reportnum: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        reportnum.keyboardType = UIKeyboardType.NumberPad
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func back(sender: AnyObject) {
        reportnum.resignFirstResponder()
    }
    @IBAction func submit(sender: AnyObject) {
        if(shenfen == 1)
        {
        liebiao1[21] = reportnum.text
        }
        else if(shenfen == 5)
        {
            money2[15] = reportnum.text
        }
        else if(shenfen == 6)
        {
            writing2[12] = reportnum.text
        }
        isSave = true
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
