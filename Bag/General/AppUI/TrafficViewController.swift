//
//  TrafficViewController.swift
//  Bag
//
//  Created by ligh on 15/8/20.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit
import CoreData


/***
    交通信息
**/
class TrafficViewController: LighBaseViewController {
    
    @IBOutlet weak var trafficfightButton: UIButton!//飞机
    @IBOutlet weak var trainButton: UIButton!//火车
    @IBOutlet weak var trainNumberTextField: UITextField!//车次
    @IBOutlet weak var startDateTextField: UITextField!//出发日期
    
    var travel:Travel!//交通信息所属的行程


    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarTitle("交通")
        self.navigationBarView.setRightBarItemStyle(ImageStyle.SaveImageStyle)
    }
    
    
    
    override func onRightNavigationBarItemTaped() {
        
        NSLog("%@",ID.next_trafficID())
    }
    
    //点击出发日期
    @IBAction func onStartDateControlTapped(sender: AnyObject) {
        
        CalendarPicker.showPicker(self.view, dateBlock: { (date) -> Void in
            
           self.startDateTextField.text = date.toString(format: DateFormat.Custom("yyyy-MM-dd"))
        })
    }

    
    //点击飞机按钮
    @IBAction func onFightButtonTapped(sender: AnyObject) {
        
        
        
    }
}