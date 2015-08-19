//
//  EditTravelViewController.swift
//  Bag
//
//  Created by ligh on 15/8/16.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit
//import SwiftMoment

/***
**
**添加/编辑行程
**/
class EditTravelViewController: LighBaseViewController {
    
    
    @IBOutlet weak var travelNameTextField: UITextField!//行程名称
    @IBOutlet weak var travelDateTextField: UITextField!//行程日期
    @IBOutlet weak var travelDestinationTextField: UITextField!//行程目的地
    
    var date:NSDate?
    

    var travel:Travel? //编辑的行程

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarTitle((travel == nil) ? "添加行程" : "编辑行程")

        self.navigationBarView.setRightBarItemStyle(ImageStyle.SaveImageStyle)
        
        showTravel()
    
    }
    
    
    /**显示行程信息**/
    private func showTravel() {
    
        
        if let travelInfo = self.travel
        {
                self.date = travelInfo.date
                travelNameTextField.text = travelInfo.name
                travelDateTextField.text = travelInfo.date.toString(format: DateFormat.Custom("yyyy-MM-dd"))
                travelDestinationTextField.text = travelInfo.destination
        }
    }

    //============================ events =================================//

    //选择出发日期
    @IBAction func onTravelDateButtonTapped(sender: AnyObject) {
        
        var picker = CalendarPicker.viewFromXIB() as! CalendarPicker
        picker.showPicker(self.view, dateBlock: { (date:NSDate) -> Void in
            
            self.travelDateTextField.text = date.toString(format: DateFormat.Custom("yyyy-MM-dd"))

            self.date = date
        })

        
    }
    
    
    //用户选择了某个推荐行程
    @IBAction func onRecommendTravelControlTapped(sender: AnyObject) {
        
        self.travelNameTextField.text = RecommendTravel.travelForID(sender.tag).name
    }
    
    
    //点击保存按钮
    override func onRightNavigationBarItemTaped() {
        
        
        if(travelNameTextField.text.isEmpty)
        {
            CSNotificationView.ShowNotificationViewStyleErrorInWindow("请输入行程名称");
            return;
        }
        
        if(travelDateTextField.text.isEmpty)
        {
            CSNotificationView.ShowNotificationViewStyleErrorInWindow("请选择行程日期");
            return;
        }
        
        if(travelDestinationTextField.text.isEmpty)
        {
            CSNotificationView.ShowNotificationViewStyleErrorInWindow("请填写目的地");
            return;
        }
        
        
        
        if let tempTravel = self.travel
        {
            self.date = self.travel!.date
        }else
        {
            self.travel = Travel.newObject() as? Travel
            self.travel!.tid = ID.makeNextT_ID()
        }
        
        self.travel!.name = travelNameTextField.text
        self.travel!.destination = travelDestinationTextField.text
        self.travel!.date = self.date!
        self.travel!.save()

        
        CSNotificationView.ShowNotificationViewStyleErrorInWindow("哇哈 我保存好了~~", completed: { () -> Void in
           
            self.navigationController?.popViewControllerAnimated(true);
        });
        
        
    }
    
    

}


//推荐行程
class RecommendTravel {
    
    var id:Int?
    var name:String?
    var iconName:String?
    
    init(id:Int,name:String,iconName:String){
        self.id = id
        self.name = name
    }
    
    class func travelForID(id:Int) -> RecommendTravel{
        
        switch(id){
        case 1:
            return RecommendTravel(id: 1, name: "打羽毛球", iconName:"")
        case 2:
            return RecommendTravel(id: 2, name: "游泳", iconName:"")
        case 3:
            return RecommendTravel(id: 2, name: "打篮球", iconName:"")
        case 4:
            return RecommendTravel(id: 2, name: "打乒乓球", iconName:"")
        case 5:
            return RecommendTravel(id: 2, name: "滑雪", iconName:"")
            
        default:
                return RecommendTravel(id: 1, name: "打羽毛球", iconName:"")
        }
    }

}

