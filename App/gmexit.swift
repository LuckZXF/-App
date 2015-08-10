//
//  gmexit.swift
//  App
//
//  Created by 赵希帆 on 15/6/14.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class gmexit : UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func exit(sender: AnyObject) {
        count2 = nil
        shenfen = 0
        gmuseremail.removeAll(keepCapacity: true)
        gmuserid.removeAll(keepCapacity: true)
        gmusername.removeAll(keepCapacity: true)
        gmuserpassword.removeAll(keepCapacity: true)
        gmuserphone.removeAll(keepCapacity: true)
        gmuserpower.removeAll(keepCapacity: true)
        pinggu.removeAll(keepCapacity: true)
        salesman.removeAll(keepCapacity: true)
        appraiser.removeAll(keepCapacity: true)
        firstevaluate.removeAll(keepCapacity: true)
        secondvaluate.removeAll(keepCapacity: true)
        var view = self.storyboard?.instantiateViewControllerWithIdentifier("ClientLogin") as ViewController
        self.presentViewController(view, animated: true, completion: nil)
    }
}
