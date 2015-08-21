//
//  Travel.swift
//  Bag
//
//  Created by ligh on 15/8/20.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import Foundation
import CoreData

@objc(Travel)
class Travel: NSManagedObject {

    @NSManaged var date: NSDate
    @NSManaged var destination: String
    @NSManaged var name: String
    @NSManaged var tid: NSNumber
    @NSManaged var travelArticle: NSSet

}
