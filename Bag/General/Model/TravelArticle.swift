//
//  TravelArticle.swift
//  Bag
//
//  Created by ligh on 15/8/22.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import Foundation
import CoreData

@objc(TravelArticle)
class TravelArticle: NSManagedObject {

    @NSManaged var ta_id: NSNumber
    @NSManaged var taked: NSNumber
    @NSManaged var article: Article
    @NSManaged var travel: Travel

}
