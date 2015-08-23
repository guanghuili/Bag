//
//  TravelArticlesViewController.swift
//  Bag
//
//  Created by ligh on 15/8/20.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit
import CoreData

//行程物品
class TravelArticlesViewController : LighBaseTableViewController{
    
    
    @IBOutlet weak var allBtn: UIButton! //全部
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationBarTitle("物品")
        self.tableview?.rowHeight = 44

    }
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
     
        return 10
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
            return ArticleCategorySectionView.viewFromXIB()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
     func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }

    
    override func cellDataAtIndexPath(indexPath: NSIndexPath) -> AnyObject {
        return ""
    }
    
    override func cellIdentifierForIndexPath(indexPath: NSIndexPath) -> String {
        
        return  "TravelInfoArticelsCell"
    }
    
}