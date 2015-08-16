//
//  LighSwipeCell.swift
//  Bag
//
//  Created by ligh on 15/8/14.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit

/**
    支持左右滑动出现菜单
**/
class LighSwipeCell: UITableViewCell , UIGestureRecognizerDelegate{

    //包裹cell内容 view
    @IBOutlet var wraperView:UIView?
    //左边菜单view 可以把向右滑动出现的菜单放到里面
    @IBOutlet var leftWraperMenuView:UIView?
    //右边边菜单view 可以把向左滑动出现的菜单放到里面
    @IBOutlet var rightWraperMenuView:UIView?
    
    var netTranslation : CGPoint = CGPoint(x: 0, y: 0)//平移
    var touchuFirstY:CGFloat = 0
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initWraperViewGestureRecognizer()
    }
    
    /**
    **初始化Wraper手势
    **/
    func initWraperViewGestureRecognizer()
    {
        var panGesture = UIPanGestureRecognizer(target: self, action: "handlePanGesture:")
        panGesture.maximumNumberOfTouches = 1
        panGesture.delegate = self;
         self.wraperView?.addGestureRecognizer(panGesture)
             
    }
    
    
    func handlePanGesture(sender: UIPanGestureRecognizer) {
        
    
        //得到拖的过程中的xy坐标
        var translation : CGPoint = sender.translationInView(self.wraperView!)
        
        if (sender.state == UIGestureRecognizerState.Ended)  {
     

           
            
          
        }else if(sender.state == UIGestureRecognizerState.Changed)
        {
            
            
            self.wraperView!.x += translation.x;
            sender.setTranslation(CGPointZero, inView: self.wraperView!)
            
        }
    }
    
    //****** UIGestureRecognizerDelegate **===========/
    
    override func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if (gestureRecognizer.respondsToSelector("translationInView:"))
        {
            var panGestureRecognizer = gestureRecognizer as! UIPanGestureRecognizer
            var translation = panGestureRecognizer.translationInView(self.wraperView!)
            
            return (translation.y-touchuFirstY) < 5;
        }
        
        
        return false;
    }

}
