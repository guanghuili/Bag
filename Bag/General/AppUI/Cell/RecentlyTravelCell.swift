//
//  TravelCell.swift
//  Bag
//
//  Created by ligh on 15/8/15.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit

/**
**
**最近即将出发的行程cell
**/
class RecentlyTravelCell: SwipeEditCell {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //去掉按下背景
        self.selectionStyle = UITableViewCellSelectionStyle.None

    }
}
