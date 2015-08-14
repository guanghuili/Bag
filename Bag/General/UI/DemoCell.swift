//
//  DemoCell.swift
//  Bag
//
//  Created by ligh on 15/8/14.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit

class DemoCell: UITableViewCell {
    
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib()
    {
            self.contentView.bounds = UIScreen.mainScreen().bounds
    }
    
}
