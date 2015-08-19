//
//  TravelListViewController.swift
//  Bag
//
//  Created by ligh on 15/8/15.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit
import CoreData

/***
    行程列表viewController
**/
class TravelListViewController: LighBaseTableViewController,NSFetchedResultsControllerDelegate {
    
    
    var fetchResultController:NSFetchedResultsController!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.fetchResultController = Travel.fetchedResultsController(sortDescriptorMap: ["date":true], delegate: self)

        
        var avatarView = UserAvatarSliceView.viewFromXIB()!
        avatarView.bottom = self.navigationBarView.height - 10;
        avatarView.x = 15
        
       self.navigationBarView.addSubview(avatarView)
       self.navigationBarView.setRightBarItemStyle(ImageStyle.AddTravelImageStyle)

    }

    
    
    //mark UIStroyBoard
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //如果是编辑行程
        if(segue.identifier!.isEqualToString(string: "EditTravel")) {

            if let indexPath = self.tableview?.indexPathForView((sender as! UIView)) {
                //将需要编辑的行程传值编辑页面
                var travel:Travel = self.cellDataAtIndexPath(indexPath) as! Travel
                var editTravelViewController = segue.destinationViewController  as! EditTravelViewController
                editTravelViewController.travel = travel

            }
        }
        
    }

    
    
    override func onRightNavigationBarItemTaped() {
        self.navigationController?.pushViewController(EditTravelViewController.viewController(), animated: true);
    }
    
    //删除行程
    @IBAction func onDelTravelButtonTapped(sender: AnyObject) {
        
        if let indexPath = self.tableview?.indexPathForView((sender as! UIView)) {

            
            LighAlertView.showLighAlertView("", msg: "真的要删我吗？", style: LightAlertViewStyle.Warning, doneButtonTitle: "当然真的", buttonClick: { (btnIndex) -> Void in
                
                if(btnIndex == 1) {
                
                    var travel = self.cellDataAtIndexPath(indexPath) as! Travel
                    travel.deleteObject()

                    
                }
                
            })
        }
        
    }
    
    //*********************** 【TableView】 w********************************//
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
            return self.fetchResultController.sections!.count
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        let sectionInfo = self.fetchResultController.sections![section] as! NSFetchedResultsSectionInfo
        var numRows = sectionInfo.numberOfObjects
        return numRows
        
    }
    
    
    override func cellIdentifierForIndexPath(indexPath: NSIndexPath) -> String {
        
        if(indexPath.row == 0) {
            return "RecentlyTravelCell" //如果是第一条数据 显示最近的行程信息
        }else{
            
            return "TravelCell"
        }
    }
    
    
    override func heightForRowAtIndexPath(tableView: UITableView, atIndexPath: NSIndexPath) -> CGFloat {
            if(atIndexPath.row == 0) {
                return 175
           }
        
        return 80
    }
    
    override func cellDataAtIndexPath(indexPath: NSIndexPath) -> AnyObject {
        
        var travel = self.fetchResultController.objectAtIndexPath(indexPath) as! Travel
        return travel 
        
    }
    
    //MARK: NSFetchedResultsControllerDelegate
    
     func controllerWillChangeContent(controller: NSFetchedResultsController) {
        self.tableview?.beginUpdates()
    }
    

    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        let tableView = self.tableview
        switch(type) {
        case NSFetchedResultsChangeType.Insert:
            
             self.tableview?.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: UITableViewRowAnimation.Bottom)
        case .Delete:
             self.tableview?.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: UITableViewRowAnimation.Middle)
        default:
            println("default")
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        
        self.tableview?.endUpdates()
        self.tableview?.reloadData()
        
    }

}
