//
//  IDExtionsion.swift
//  Bag
//
//  Created by ligh on 15/8/17.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import Foundation


extension ID {

    
     //查看下一个travel_id
    class func nextT_ID () ->NSNumber {
        
        var id:AnyObject? = self.fetchObject(maxKey: "travel_id")
        
        if let tempID = id {
        
            //查询出最大的t_id  +1 就是下一个id
            return (tempID as! ID).travel_id.integerValue + 1
        
        }else
        {
            var id:ID = ID.newObject() as! ID
            id.travel_id = 1
            id.save()
            
            return 1;
        }

    }
    
    /**
        生产一个t_id
    **/
    class func makeNextT_ID() ->NSNumber {
    
        var id:ID = self.newObject() as! ID
        id.travel_id = self.nextT_ID()
        id.save()
        
        return id.travel_id
    
    }
    
    
    
    //查看下一个traffic_id
    class func next_trafficID() ->NSNumber {
    
        var id:AnyObject? = self.fetchObject(maxKey: "traffic_id")
    
        if let tempID = id {
    
            //查询出最大的t_id  +1 就是下一个id
            return (tempID as! ID).traffic_id.integerValue + 1
    
        }else
        {
            var id:ID = ID.newObject() as! ID
            id.traffic_id = 1
            id.save()
    
            return 1;
        }
    
    }
    
    //生成traffic_id
    class func makeNextTrafficID() ->NSNumber {
        
        var id:ID = self.newObject() as! ID
        id.traffic_id = self.next_trafficID()
        id.save()
        
        return id.traffic_id
        
    }
    
    
    //查看下一个article_category_id
    class func next_ArticleCategoryID() ->NSNumber {
        
        var id:AnyObject? = self.fetchObject(maxKey: "article_category_id")
        
        if let tempID = id {
            
            //查询出最大的article_category_id  +1 就是下一个id
            return (tempID as! ID).article_category_id.integerValue + 1
            
        }else
        {
            var id:ID = ID.newObject() as! ID
            id.article_category_id = 1
            id.save()
            
            return 1;
        }
        
    }
    
    //生成article_category_id
    class func makeArticleCategoryID() ->NSNumber {
        
        var id:ID = self.newObject() as! ID
        id.article_category_id = self.next_ArticleCategoryID()
        id.save()
        
        return id.article_category_id
        
    }
    
}