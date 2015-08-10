//
//  firstremarkView.swift
//  App
//
//  Created by 赵希帆 on 15/5/29.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class firstremarkView: UIViewController {
    
    @IBOutlet weak var firstremark: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func back(sender: AnyObject) {
        firstremark.resignFirstResponder()
    }
    @IBAction func submit(sender: AnyObject) {
        if(shenfen == 1)
        
        {
        liebiao1[12] = firstremark.text
        }
        else if(shenfen == 3)
        {
            salesman2[10] = firstremark.text
        }
        else if(shenfen == 4)
        {
            appraiser2[10] = firstremark.text
        }
        isSave = true
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
