//
//  Travel.swift
//  Bag
//
//  Created by ligh on 15/8/18.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import Foundation
import CoreData

@objc(Travel)
class Travel: NSManagedObject {

    @NSManaged var tid: NSNumber //行程id
    @NSManaged var name: String //行程名称
    @NSManaged var destination: String //行程目的地
    @NSManaged var date: NSDate //行程日期


}
