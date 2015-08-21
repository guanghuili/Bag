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

    
    @IBOutlet weak var dayLabel: UILabel!//日期
    @IBOutlet weak var weekLabel: UILabel!//星期
    @IBOutlet weak var dateLabel: UILabel! //日期
    @IBOutlet weak var nameLabel: UILabel!//行程名称主题
    @IBOutlet weak var weatherLabel: UILabel!//天气信息
    @IBOutlet weak var weatherIconImageView: UIImageView!//天气图片
    @IBOutlet weak var articleNameLabel: UILabel!//物品信息
    @IBOutlet weak var hotelsLabel: UILabel!//酒店信息
    @IBOutlet weak var trafficLabel: UILabel!//交通工具
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //去掉按下背景
        self.selectionStyle = UITableViewCellSelectionStyle.None

    }
    
    
    override func configCell(data:AnyObject) {
     
        var travel:Travel = data as! Travel
      //  nameLabel.text = travel.name

        
    }

}
