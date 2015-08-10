//
//  thirdremarkView.swift
//  App
//
//  Created by 赵希帆 on 15/6/1.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class thirdremarkView : UIViewController {
    
    @IBOutlet weak var thirdremark: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func back(sender: AnyObject) {
        thirdremark.resignFirstResponder()
    }
    
    @IBAction func submit(sender: AnyObject) {
        if(shenfen == 1)
        {
        liebiao1[26] = thirdremark.text
        }
        else if(shenfen == 5)
        {
            money2[19] = thirdremark.text
        }
        isSave = true
        self.navigationController?.popViewControllerAnimated(true)
    }
}
