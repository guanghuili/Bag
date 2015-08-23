//
//  ArticelCateogry.swift
//  Bag
//
//  Created by ligh on 15/8/23.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import Foundation
import CoreData

@objc(ArticelCateogry)
class ArticelCateogry: NSManagedObject {

    @NSManaged var ac_id: NSNumber
    @NSManaged var icon: String
    @NSManaged var name: String
    @NSManaged var order_number: NSNumber
    @NSManaged var articles: Article

}
