//
//  ArticleCategoryView.swift
//  Bag
//
//  Created by ligh on 15/8/22.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit


//物品分类view
class ArticleCategoryView : UIView {
    
    

    @IBOutlet weak var control: UIControl! //监听长按时间
    @IBOutlet weak var iconImageView: UIImageView!//分类icon
    @IBOutlet weak var nameLabel: UILabel!//分类名称
    @IBOutlet weak var coverView: CircularView! //半透明遮盖层
    
    
    var longPressBlock:LongPressBlock?
    typealias LongPressBlock = (ArticleCategoryView) ->Void;

     var articleCategory:ArticelCateogry? {
        
        //属性观察
        didSet {
        
            self.iconImageView.setImageName(articleCategory!.icon)
            self.nameLabel.text = articleCategory!.name

        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
       var longPress = UILongPressGestureRecognizer(target: self, action: "onControlLongPress:")
        longPress.minimumPressDuration = 0.4; //定义按的时间
        self.control.addGestureRecognizer(longPress)

    }
    
    
     func onControlLongPress(gestureRecognizer:UILongPressGestureRecognizer){
        
        self.hidenConverView()
        if let tempLongPressBlock = self.longPressBlock {
    
                tempLongPressBlock(self)
        }

    }
    
    
    //显示遮盖层view
    func showConverView(){
        
          self.coverView.hidden = false
    }
    
    func hidenConverView(){
        self.coverView.hidden = true
    }
    
}