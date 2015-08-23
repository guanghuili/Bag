//
//  Traffic.swift
//  Bag
//
//  Created by ligh on 15/8/22.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import Foundation
import CoreData

@objc(Traffic)
class Traffic: NSManagedObject {

    @NSManaged var d_city: String
    @NSManaged var number: String
    @NSManaged var s_city: String
    @NSManaged var s_date: NSDate
    @NSManaged var t_id: NSNumber
    @NSManaged var type: NSNumber
    @NSManaged var travel: Travel

}
