//
//  ArticelCateogryExtionsion.swift
//  Bag
//
//  Created by ligh on 15/8/22.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import Foundation

//对ArticelCateogry扩展
extension  ArticelCateogry {
    
    //如果分类列表没有数据插入默认分类
    class func insertDefaultCategoriesIfNeed() {
        
        //检查分类列表是否插入了 默认分类
        if( ArticelCateogry.countForPredicateFormat() > 0 ){
            
                return
            
        }
        
        
        var defaultCategoryNameArray = ["猜你要带":"icon_belongings_bulb","衣物":"icon_belongings_clothes","装备":"icon_belongings_equip","药箱":"icon_belongings_pyxides","洗漱":"icon_belongings_wash","设备":"icon_belongings_device","证件":"icon_belongings_credentials"]
        
        for (key,value) in defaultCategoryNameArray {
            
           var category = ArticelCateogry.newObject() as! ArticelCateogry
            category.name = key
            category.ac_id = ID.makeArticleCategoryID()
            category.order_number = category.ac_id
            category.icon = value
        }
        
        CoreDataManager.sharedCoreDataManager().saveContext()
    }
    
    
}