//
//  IDExtionsion.swift
//  Bag
//
//  Created by ligh on 15/8/17.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import Foundation


extension ID {

    class func nextT_ID () ->NSNumber {
        
        var id:AnyObject? = self.fetchObject(maxKey: "t_id")
        
        if let tempID = id {
        
            //查询出最大的t_id  +1 就是下一个id
            return (tempID as! ID).t_id.integerValue + 1
        
        }else
        {
            var id:ID = ID.newObject() as! ID
            id.t_id = 1
            id.save()
            
            return 1;
        }

    }
    
    /**
        生产一个t_id
    **/
    class func makeNextT_ID() ->NSNumber {
    
        var id:ID = self.newObject() as! ID
        id.t_id = self.nextT_ID()
        id.save()
        
        return id.t_id
    
    }
}