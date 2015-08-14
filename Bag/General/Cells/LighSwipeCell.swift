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
        var translation : CGPoint = sender.translationInView(self.contentView)
        
//        var x = self.wraperView!.x+translation.x
//        
//
//        
//        //平移图片CGAffineTransformMakeTranslation
//        if(x > 0 &&  x > self.leftWraperMenuView?.width)
//        {
//                NSLog("x > self.leftWraperMenuView?.width %f",x)
//            return
//            
//        }else if(x<0 && abs(x) > self.rightWraperMenuView?.width )
//        {
//                NSLog("abs(x) > self.rightWraperMenuView?.width %f",translation.x)
//            return
//        }
        
//         UIView.beginAnimations("", context: nil)
//     
//        UIView.commitAnimations()

        if (sender.state == UIGestureRecognizerState.Ended)  {
     
          
//           if let leftView = self.leftWraperMenuView
//           {
//                if ( leftView.x >= (leftView.right / 2)) {
//                
//                    UIView.beginAnimations("", context: nil)
//                
//                    self.wraperView?.x = leftView.right;
//                
//                    UIView.commitAnimations()
//                    
//                }
//            }
            
            
            if let rightView = self.rightWraperMenuView
            {
                  //  NSLog("rig=%f",rightView.x)
                
//                if(self.wraperView!.right >= (rightView.right - rightView.width/2))
//                {
//                  
//                    UIView.beginAnimations("", context: nil)
//                    
//                    self.wraperView!.x = 15
//                    
//                    UIView.commitAnimations()
//                    
//                }else{
                
                    
                    NSLog("x=%f",rightView.x)
                    
                   // UIView.beginAnimations("", context: nil)
                    
                    self.wraperView!.right = rightView.x
                    
                   // UIView.commitAnimations()
              //  }
            }
            
           
            
          
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

//    -(BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer
//    {
//    if ([gestureRecognizer respondsToSelector:@selector(translationInView:)])
//    {
//    CGPoint translation = [gestureRecognizer translationInView:self.superview];
//    
//    return (translation.y - touchuFirstY) < 5;
//    
//    }
//    
//    return NO;
//    }
  
}
