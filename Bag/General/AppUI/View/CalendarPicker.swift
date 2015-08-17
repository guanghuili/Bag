//
//  CalendarPicker.swift
//  Bag
//
//  Created by ligh on 15/8/17.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit

class CalendarPicker: UIView {

    
    @IBOutlet weak var monthLabel: UILabel! //显示月份和年份
    @IBOutlet weak var calendarView: CVCalendarView!//日历信息
    @IBOutlet weak var caleandarMenuView: CVCalendarMenuView!//菜单显示星期
    @IBOutlet weak var alphaView: UIControl!//透明遮盖层
    @IBOutlet weak var wraperView: UIView! //包裹日历信息 做动画效果

    var dateBlock:DateBlock?

    typealias DateBlock = (date:NSDate) ->Void;
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.monthLabel!.text = calendarView.presentedDate.commonDescription
    }
    
    
    func showPicker(inView:UIView,dateBlock:DateBlock? = nil)
    {
        self.dateBlock = dateBlock
        
        self.width = inView.width
        self.height = inView.height
        

        
        inView.addSubview(self)
        self.calendarView.commitCalendarViewUpdate()
        self.caleandarMenuView.commitMenuViewUpdate()
        
        alphaView.alpha = 0

        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
                  self.alphaView.alpha = 0.5
                self.wraperView.y = inView.height - self.wraperView.height
            
            }) { (complated) -> Void in
                
              
        }
        
    
    }
    
    func dismissPicker() {
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            
            self.wraperView.y = self.height
            self.alphaView.alpha = 0
            
        }) { (complated) -> Void in
            
            self.removeFromSuperview()
            
        }
    }
    
    //点击遮盖层 关闭页面
    @IBAction func onAlphaControlTapped(sender: AnyObject) {
        
        dismissPicker()
    }
    
    
    //点击确认按钮
    @IBAction func onConfirmButtonTapped(sender: AnyObject) {
        
        dismissPicker()
        
        if let letDateBlock = self.dateBlock
        {
            letDateBlock(date: self.calendarView.presentedDate.wraperDate)
        }
    }
  
}


extension CalendarPicker: CVCalendarViewDelegate
{
    func preliminaryView(viewOnDayView dayView: DayView) -> UIView
    {
        let circleView = CVAuxiliaryView(dayView: dayView, rect: dayView.bounds, shape: CVShape.Circle)
        circleView.fillColor = .colorFromCode(0xCCCCCC)
        return circleView
    }
    
    func preliminaryView(shouldDisplayOnDayView dayView: DayView) -> Bool
    {
        if (dayView.isCurrentDay) {
            return false
        }
        return false
    }
    
    func supplementaryView(viewOnDayView dayView: DayView) -> UIView
    {
        let π = M_PI
        
        let ringSpacing: CGFloat = 3.0
        let ringInsetWidth: CGFloat = 1.0
        let ringVerticalOffset: CGFloat = 1.0
        var ringLayer: CAShapeLayer!
        let ringLineWidth: CGFloat = 4.0
        let ringLineColour: UIColor = .blueColor()
        
        var newView = UIView(frame: dayView.bounds)
        
        let diameter: CGFloat = (newView.bounds.width) - ringSpacing
        let radius: CGFloat = diameter / 2.0
        
        let rect = CGRectMake(newView.frame.midX-radius, newView.frame.midY-radius-ringVerticalOffset, diameter, diameter)
        
        ringLayer = CAShapeLayer()
        newView.layer.addSublayer(ringLayer)
        
        ringLayer.fillColor = nil
        ringLayer.lineWidth = ringLineWidth
        ringLayer.strokeColor = ringLineColour.CGColor
        
        var ringLineWidthInset: CGFloat = CGFloat(ringLineWidth/2.0) + ringInsetWidth
        let ringRect: CGRect = CGRectInset(rect, ringLineWidthInset, ringLineWidthInset)
        let centrePoint: CGPoint = CGPointMake(ringRect.midX, ringRect.midY)
        let startAngle: CGFloat = CGFloat(-π/2.0)
        let endAngle: CGFloat = CGFloat(π * 2.0) + startAngle
        let ringPath: UIBezierPath = UIBezierPath(arcCenter: centrePoint, radius: ringRect.width/2.0, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        ringLayer.path = ringPath.CGPath
        ringLayer.frame = newView.layer.bounds
        
        return newView
    }
    
    func supplementaryView(shouldDisplayOnDayView dayView: DayView) -> Bool
    {
        return false
    }
}


extension CalendarPicker: CVCalendarViewDelegate {
    func presentationMode() -> CalendarMode {
        return .MonthView
    }
    
    func firstWeekday() -> Weekday {
        return .Sunday
    }
    
    func shouldShowWeekdaysOut() -> Bool {
        return true
    }
    
    func didSelectDayView(dayView: CVCalendarDayView) {
   
    }
    
    func presentedDateUpdated(date: CVDate) {
        
        
        self.monthLabel!.text = date.globalDescription
        
    }
    
    func topMarker(shouldDisplayOnDayView dayView: CVCalendarDayView) -> Bool {
        return true
    }
    
    func dotMarker(shouldShowOnDayView dayView: CVCalendarDayView) -> Bool {
        let day = dayView.date.day
        let randomDay = Int(arc4random_uniform(31))
        if day == randomDay {
            return true
        }
        
        return false
    }
    
    func dotMarker(colorOnDayView dayView: CVCalendarDayView) -> [UIColor] {
        let day = dayView.date.day
        
        let red = CGFloat(arc4random_uniform(600) / 255)
        let green = CGFloat(arc4random_uniform(600) / 255)
        let blue = CGFloat(arc4random_uniform(600) / 255)
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        let numberOfDots = Int(arc4random_uniform(3) + 1)
        switch(numberOfDots) {
        case 2:
            return [color, color]
        case 3:
            return [color, color, color]
        default:
            return [color] // return 1 dot
        }
    }
    
    func dotMarker(shouldMoveOnHighlightingOnDayView dayView: CVCalendarDayView) -> Bool {
        return true
    }
}

// MARK: - CVCalendarViewAppearanceDelegate

extension CalendarPicker: CVCalendarViewAppearanceDelegate {
    func dayLabelPresentWeekdayInitallyBold() -> Bool {
        return true
    }
    
    func spaceBetweenDayViews() -> CGFloat {
        return 1
    }
}

extension CalendarPicker: CVCalendarMenuViewDelegate {
    // firstWeekday() has been already implemented.
}


extension CalendarPicker {
    func toggleMonthViewWithMonthOffset(offset: Int) {
        let calendar = NSCalendar.currentCalendar()
        let calendarManager = self.calendarView!.manager
        let components = Manager.componentsForDate(NSDate()) // from today
        
        components.month += offset
        
        let resultDate = calendar.dateFromComponents(components)!
        
        self.calendarView!.toggleViewWithDate(resultDate)
    }
}