//
//  TravelListViewController.swift
//  Bag
//
//  Created by ligh on 15/8/15.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit

/***
    行程列表viewController
**/
class TravelListViewController: LighBaseTableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     
        self.dataArray = ["","",""]
        self.tableview?.reloadData()
    }
    
    override func cellIdentifierForIndexPath(indexPath: NSIndexPath) -> String {
        
        if(indexPath.row == 0) {
            
            return "RecentlyTravelCell" //如果是第一条数据 显示最近的行程信息
            
        }else{
            
            return "TravelCell"
        }
        
    }
    
    
    override func heightForRowAtIndexPath(tableView: UITableView, atIndexPath: NSIndexPath) -> CGFloat {
        
        NSLog("aa")
            if(atIndexPath.row == 0) {
                return 175
           }
        
        return 80
    }
    
    override func configureCell(cell: UITableViewCell, withData: AnyObject) {
        
    }
    

}
