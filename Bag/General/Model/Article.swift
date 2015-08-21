//
//  Article.swift
//  Bag
//
//  Created by ligh on 15/8/20.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import Foundation
import CoreData

@objc(Article)
class Article: NSManagedObject {

    @NSManaged var a_id: NSNumber
    @NSManaged var name: String

}
