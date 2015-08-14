//
//  ViewController.swift
//  swift-lib
//
//  Created by ligh on 15/5/30.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: LighBaseTableViewController {


  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArray = ["是一首由萨米族歌手Sofia Jannok演唱的萨米族语歌曲。如此轻柔的北欧风格","感觉自己就像一只翱翔在海上的海鸥一样。第一次听这首歌就爱上了，感觉好温暖的声音，所有的不快和烦恼都变得不再那么重要。这是发自内心地真情流露，听着舒缓的钢琴前奏，纯净的北欧女声哼唱，让我们放下手下所有的事情，停下你的脚步，安静的聆听这","这是一首由萨米族歌手Sofia Jannok演唱的萨米族语歌曲。如此轻柔的北欧风格，感觉自己就像一只翱翔在海上的海鸥一样。第一次听这首歌就爱上了，感觉好温暖的声音，所有的不快和烦恼都变得不再那么重要。这是发自内心地真情流露，听着舒缓的钢琴前奏，纯净的北欧女声哼唱，让我们放下手下所有的事情，停下你的脚步，安静的聆听这段旋律，相信你肯定会喜欢上的。也许只有这样的音乐才能慰藉自己浮躁的心。","这是一首由萨米族歌手Sofia Jannok演唱的萨米族语歌曲。如此轻柔的北欧风格，感觉自己就像一只翱翔在海上的海鸥一样。第一次听这首歌就爱上了，感觉好温暖的声音，所有的不快和烦恼都变得不再那么重要。这是发自内心地真情流露，听着舒缓的钢琴前奏，纯净的北欧女声哼唱，让我们放下手下所有的事情，停下你的脚步，安静的聆听这段旋律，相信你肯定会喜欢上的。也许只有这样的音乐才能慰藉自己浮躁的心。这是一首由萨米族歌手Sofia Jannok演唱的萨米族语歌曲。如此轻柔的北欧风格，感觉自己就像一只翱翔在海上的海鸥一样。第一次听这首歌就爱上了，感觉好温暖的声音，所有的不快和烦恼都变得不再那么重要。这是发自内心地真情流露，听着舒缓的钢琴前奏，纯净的北欧女声哼唱，让我们放下手下所有的事情，停下你的脚步，安静的聆听这段旋律，相信你肯定会喜欢上的。也许只有这样的音乐才能慰藉自己浮躁的心。这是一首由萨米族歌手Sofia Jannok演唱的萨米族语歌曲。如此轻柔的北欧风格，感觉自己就像一只翱翔在海上的海鸥一样。第一次听这首歌就爱上了，感觉好温暖的声音，所有的不快和烦恼都变得不再那么重要。这是发自内心地真情流露，听着舒缓的钢琴前奏，纯净的北欧女声哼唱，让我们放下手下所有的事情，停下你的脚步，安静的聆听这段旋律，相信你肯定会喜欢上的。也许只有这样的音乐才能慰藉自己浮躁的心。这是一首由萨米族歌手Sofia Jannok演唱的萨米族语歌曲。如此轻柔的北欧风格，感觉自己就像一只翱翔在海上的海鸥一样。第一次听这首歌就爱上了，感觉好温暖的声音，所有的不快和烦恼都变得不再那么重要。这是发自内心地真情流露，听着舒缓的钢琴前奏，纯净的北欧女声哼唱，让我们放下手下所有的事情，停下你的脚步，安静的聆听这段旋律，相信你肯定会喜欢上的。也许只有这样的音乐才能慰藉自己浮躁的心。"]
        
        tableview?.reloadData()
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.heightForRowAtIndexPath(tableview!, atIndexPath: indexPath)
    }
    
    override func cellIdentifierForIndexPath(indexPath: NSIndexPath) -> String {
        return "DemoCell"
    }
    
    override func configureCell(cell: UITableViewCell, withData: AnyObject) {
        
        cell.fd_enforceFrameLayout = false
        var demoCell:DemoCell = cell as! DemoCell
        demoCell.label.text = withData as! String

        
    }

}

