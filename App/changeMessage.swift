//
//  changeMessage.swift
//  App
//
//  Created by 赵希帆 on 15/4/21.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class changeMessage : UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
}
