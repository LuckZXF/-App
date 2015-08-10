//
//  secondsuggestionView.swift
//  App
//
//  Created by 赵希帆 on 15/5/30.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class secondsuggestionView : UIViewController {
    
    @IBOutlet weak var secondsuggestion: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func back(sender: AnyObject) {
        secondsuggestion.resignFirstResponder()
    }
    
    @IBAction func submit(sender: AnyObject) {
        if(shenfen == 1)
        {
        liebiao1[20] = secondsuggestion.text
        }
        else if(shenfen == 8)
        {
            evaluate22[14] = secondsuggestion.text
        }
        isSave = true
        self.navigationController?.popViewControllerAnimated(true)
    }
}
