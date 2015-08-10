//
//  firstsuggestionView.swift
//  App
//
//  Created by 赵希帆 on 15/5/30.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class firstsuggestView : UIViewController {
    

    @IBOutlet weak var firstsuggest: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func back(sender: AnyObject) {
        firstsuggest.resignFirstResponder()
    }
   
    @IBAction func submit(sender: AnyObject) {
        if(shenfen == 1)
        {
        liebiao1[18] = firstsuggest.text
        }
        else if(shenfen == 7)
        {
            evaluate2[10] = firstsuggest.text
        }
        isSave = true
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
