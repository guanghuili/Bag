//
//  EditTravelViewController.swift
//  Bag
//
//  Created by ligh on 15/8/16.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit

/***
**
**添加/编辑行程
**/
class EditTravelViewController: LighBaseViewController {
    
    
    @IBOutlet weak var travelNameTextField: UITextField!//行程名称
    
    @IBOutlet weak var travelDateTextField: UITextField!//行程日期
    
    @IBOutlet weak var travelDestinationTextField: UITextField!//行程目的地
    
    
    
    var travel:Travel? //编辑的行程

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarTitle((travel == nil) ? "添加行程" : "编辑行程")

        self.navigationBarView.setRightBarItemStyle(ImageStyle.SaveImageStyle)
        
        
        
    }

    
    //点击保存按钮
    override func onRightNavigationBarItemTaped() {
        
        if(travelNameTextField.text.isEmpty)
        {
//            LighAlertView.showLighAlertView("a", msg: "a", buttonClick: { (buttonIndex) -> Void in
//
//            })
            
            CSNotificationView.ShowNotificationViewStyleErrorInWindow("请输入行程名称");
        }
        
    }
    

}
