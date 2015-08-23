//
//  ID.swift
//  Bag
//
//  Created by ligh on 15/8/22.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import Foundation
import CoreData

@objc(ID)
class ID: NSManagedObject {

    @NSManaged var article_id: NSNumber
    @NSManaged var traffic_id: NSNumber
    @NSManaged var travel_id: NSNumber
    @NSManaged var travelarticle_id: NSNumber
    @NSManaged var article_category_id: NSNumber

}
