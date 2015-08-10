//
//  secondremarkView.swift
//  App
//
//  Created by 赵希帆 on 15/5/31.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class secondremarkView : UIViewController {
    
    @IBOutlet weak var secondremark : UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func back(sender: AnyObject) {
        secondremark.resignFirstResponder()
    }
    
    @IBAction func submit(sender: AnyObject) {
        if(shenfen == 1)
        {
        liebiao1[24] = secondremark.text
        }
        else if(shenfen == 6)
        {
            writing2[15] = secondremark.text
        }
        isSave = true
        self.navigationController?.popViewControllerAnimated(true)
        
    }
}
