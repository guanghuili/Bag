//
//  ArticlesViewController.swift
//  Bag
//
//  Created by ligh on 15/8/20.
//  Copyright (c) 2015年 ligh. All rights reserved.
//
import UIKit
import CoreData


/***
* 
家当列表 可以编辑添加物品
*
**/
class ArticlesViewController: LighBaseTableViewController {

    
    //分类列表scrollview
    @IBOutlet weak var categoriesScrollView: UIScrollView!
    
    @IBOutlet weak var editView: UIView! //编辑面板view 提供删除编辑位置变化
    
    var editingArticleCategoryView:ArticleCategoryView? //用户正在编辑的物品分类view
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarTitle("家当")
        self.navigationBarView.rightButton.setImageStyle(ImageStyle.SaveImageStyle, forState: UIControlState.Normal)
        self.navigationBarView.rightButton.hidden = true
        
        self.tableview?.height = 46
        self.setTestData()

        
        self.loadCategories()
    }
    
    
    
    override func onRightNavigationBarItemTaped() {
        
            self.hidenEditView()
        
    }
    
    private func loadCategories() {
        
        
        //加载分类列表
        ArticelCateogry.insertDefaultCategoriesIfNeed()
        
        var categories = ArticelCateogry.executeQuery(sortDescriptorMap: ["order_number":false])!
        
        for(var i=0;i<categories.count; i++) {
            var articleView = (ArticleCategoryView.viewFromXIB()  as! ArticleCategoryView)
            articleView.y = CGFloat(i) * articleView.height
            var category = categories[i] as! ArticelCateogry
            articleView.articleCategory = category
            categoriesScrollView.addSubview(articleView)
            articleView.longPressBlock =  { (sender:ArticleCategoryView) in
            
                self.editingArticleCategoryView = sender
                
                for (eachView) in self.categoriesScrollView.subviews {
                    
                    self.showEditView()
                    
                    var subView = eachView as! UIView
                    if(subView.isKindOfClass(ArticleCategoryView)){
                        
                        var articleCategoryView = subView as! ArticleCategoryView
                        if(articleCategoryView != sender){
                            articleCategoryView.showConverView()
                        }
                    }
                    
                }
                
            }
        }
      
        
        //向列表中追加 添加分类按钮
        var addCategoryView = (ArticleCategoryView.viewFromXIB()  as! ArticleCategoryView)
        addCategoryView.y = CGFloat(categories.count*95)
        addCategoryView.control.addTarget(self, action: "onAddCategoryViewTapped", forControlEvents: UIControlEvents.TouchUpInside)
        categoriesScrollView.addSubview(addCategoryView)

        
        categoriesScrollView.contentSize = CGSizeMake(0,CGFloat((categories.count+1)*95))
        
        
    }
    
    //显示编辑view
    private func showEditView(){
        
        if(!editView.hidden){
            return
        }
        
        self.navigationBarView.rightButton.hidden = false
        editView.hidden = false
    }
    
    //关闭编辑view
    private func hidenEditView(){
        
        self.editView.hidden = true
        self.navigationBarView.rightButton.hidden = true
        
        for (eachView) in self.categoriesScrollView.subviews {
            
            var subView = eachView as! UIView
            if(subView.isKindOfClass(ArticleCategoryView)){
                
                var articleCategoryView = subView as! ArticleCategoryView
                articleCategoryView.hidenConverView()
            }
            
        }

        
    }

    
//-------------------------events------------------------------//
    func onAddCategoryViewTapped(){
        NSLog("aa")
    }
    
    //向下移动
    @IBAction func onMoveDownButtonTapped(sender: AnyObject) {
        
        let index = self.categoriesScrollView.subviews.indexOf(self.editingArticleCategoryView!)
       
        if(index+1 <  self.categoriesScrollView.subviews.count-1)
        {
            var nextCategoryView = self.categoriesScrollView.subviews[index+1] as! ArticleCategoryView
            var nextCategoryViewFrame = nextCategoryView.frame
            
            var nextArticleCategoryOrderNumber = nextCategoryView.articleCategory?.order_number
            
            nextCategoryView.articleCategory?.order_number = self.editingArticleCategoryView!.articleCategory!.order_number
            self.editingArticleCategoryView!.articleCategory?.order_number = nextArticleCategoryOrderNumber!
            
            
            //只会交换层级不会交换frame
            self.categoriesScrollView!.exchangeSubviewAtIndex(index,withSubviewAtIndex :index+1)
            
            UIView.animate({ () -> Void in
                
                nextCategoryView.frame = self.editingArticleCategoryView!.frame
                self.editingArticleCategoryView?.frame = nextCategoryViewFrame
                self.categoriesScrollView.contentOffset = CGPointMake(0,self.editingArticleCategoryView!.y/2.0)
                
            })
            
        }
        
        CoreDataManager.sharedCoreDataManager().saveContext()
        
    }
    
    //向上移动
    @IBAction func onMoveUpButtonTapped(sender: AnyObject) {
        
        let index = self.categoriesScrollView.subviews.indexOf(self.editingArticleCategoryView!)
        
        if(index-1 >=  0)
        {
            var upCategoryView = self.categoriesScrollView.subviews[index-1] as! ArticleCategoryView
            var upCategoryViewFrame = upCategoryView.frame
            
            var upArticleCategoryOrderNumber = upCategoryView.articleCategory?.order_number
            
            upCategoryView.articleCategory?.order_number = self.editingArticleCategoryView!.articleCategory!.order_number
            self.editingArticleCategoryView!.articleCategory?.order_number = upArticleCategoryOrderNumber!
            
            
            //只会交换层级不会交换frame
            self.categoriesScrollView!.exchangeSubviewAtIndex(index,withSubviewAtIndex :index-1)
            
            UIView.animate({ () -> Void in
                

                upCategoryView.frame = self.editingArticleCategoryView!.frame
                self.editingArticleCategoryView?.frame = upCategoryViewFrame
                self.categoriesScrollView.contentOffset = CGPointMake(0,self.editingArticleCategoryView!.y/2.0)

            })
            
        }
        
        CoreDataManager.sharedCoreDataManager().saveContext()

    }
    
    //mark UITableViewDegate UITableViewDataSource
    override func cellIdentifierForIndexPath(indexPath: NSIndexPath) -> String {
        
        return "EditTravelArticleCell"
    }
    
    
}