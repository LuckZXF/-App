//
//  contactView.swift
//  App
//
//  Created by 赵希帆 on 15/5/28.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class contactView: UIViewController {
    
    @IBOutlet weak var contact: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func back(sender: AnyObject) {
        contact.resignFirstResponder()
    }
    @IBAction func submit(sender: AnyObject) {
        if(shenfen == 1)
        {
        liebiao1[4] = contact.text!
        }
        else if(shenfen == 3)
        {
            salesman2[2] = contact.text!
        }
        else if(shenfen == 4)
        {
            appraiser2[2] = contact.text!
        }
        isSave = true
        self.navigationController?.popViewControllerAnimated(true)
    }
}
