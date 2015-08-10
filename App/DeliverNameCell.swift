//
//  DeliverNameCell.swift
//  App
//
//  Created by 赵希帆 on 15/5/21.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class DeliverNameCell : UITableViewCell {
    
    @IBOutlet weak var Delivername: UILabel!
    var delivername : String?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
}
