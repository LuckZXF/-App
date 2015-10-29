//
//  thirdView.swift
//  App
//
//  Created by 赵希帆 on 15/4/22.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class thirdView : UIViewController {
    
    @IBAction func exitbtn(sender: AnyObject) {
        
        
        
         test = nil
        test0 = nil
        test2 = nil
        test3 = nil
        
        a
        
        
        test4 = nil
        test5 = nil
        count1 = nil
        mostpinggu = 0
        isSave = false
        liebiao1.removeAll(keepCapacity: true)
        liebiao.removeAll(keepCapacity: true)
        count1?.removeAllObjects()
        pinggu.removeAll(keepCapacity: true)
        var view = self.storyboard?.instantiateViewControllerWithIdentifier("ClientLogin") as! ViewController
        self.presentViewController(view, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
    
}