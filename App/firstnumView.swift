//
//  firstnumView.swift
//  App
//
//  Created by 赵希帆 on 15/5/27.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class firstnumView : UIViewController {
    
    
    @IBOutlet weak var firstnumtext: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstnumtext.keyboardType = UIKeyboardType.NumberPad
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   // @IBOutlet weak var dismisstext: UIButton!
    
    @IBAction func dismisstext(textField : UITextField!) {
        firstnumtext.resignFirstResponder()
    }
    @IBAction func submit(sender: AnyObject) {
        if(shenfen == 1)
        {
        liebiao1[2] = firstnumtext.text!
        }
        else if(shenfen == 3)
        {
            salesman2[0] = firstnumtext.text!
        }
        isSave = true
        self.navigationController?.popViewControllerAnimated(true)
        
    }
}
