//
//  contactphoneView.swift
//  App
//
//  Created by 赵希帆 on 15/5/28.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class contactphoneView: UIViewController {
    
    @IBOutlet weak var contactphone: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        contactphone.keyboardType = UIKeyboardType.NumberPad
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func back(sender: AnyObject) {
        contactphone.resignFirstResponder()
    }
    @IBAction func submit(sender: AnyObject) {
        if(shenfen == 1)
        {
        liebiao1[5] = contactphone.text!
        }
        else if(shenfen == 3)
        {
            salesman2[3] = contactphone.text!
        }
        else if(shenfen == 4)
        {
            appraiser2[3] = contactphone.text!
        }
        isSave = true
        self.navigationController?.popViewControllerAnimated(true)
    }
}
