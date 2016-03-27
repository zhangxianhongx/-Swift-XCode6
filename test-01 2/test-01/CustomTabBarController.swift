//
//  CustomTabBarController.swift
//  test-01
//
//  Created by Mac on 15-11-23.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

import UIKit
import Foundation

class CustomTabBarController: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //设置导航栏主题
        let navAppearance = UINavigationBar.appearance()
        navAppearance.barTintColor = UIColor(patternImage: UIImage(named: "pic_title_bg.9")!)
//        navAppearance.backgroundColor = UIColor.purpleColor()

        // 设置导航titleView字体
//        navAppearance.translucent = false
//        navAppearance.titleTextAttributes = [NSFontAttributeName : theme.SDNavTitleFont, NSForegroundColorAttributeName : UIColor.blackColor()]
        
//        let item = UIBarButtonItem.appearance()
//        item.setTitleTextAttributes([NSFontAttributeName : theme.SDNavItemFont, NSForegroundColorAttributeName : UIColor.blackColor()], forState: .Normal)
       
    
    
        let home1 = HomeViewController(nibName:"HomeViewController",bundle:nil);
        let video = VideoViewController(nibName:"VideoViewController",bundle:nil);
        let more = MoreViewController(nibName:"MoreViewController",bundle:nil);
        let only = OnlyViewController(nibName:"OnlyViewController",bundle:nil)
        
        
        home1.tabBarItem.image = UIImage(named:"home@2x")
        video.tabBarItem.image = UIImage(named: "discover@2x")
        more.tabBarItem.image = UIImage(named: "payticket@2x")
        only.tabBarItem.image = UIImage(named: "store@2x")

        
        home1.title = "主页"
        video.title = "电影"
        only.title = "收藏"
        more.title = "购票"
        
        let nav1 = UINavigationController(rootViewController: home1)
        let nav2 = UINavigationController(rootViewController: video)
        let nav3 = UINavigationController(rootViewController: more)
        let nav4 = UINavigationController(rootViewController: only)

        
        //取到箭头指向的视图
        let story = UIStoryboard(name: "MyViewController", bundle: nil)
        let myNav : UINavigationController = story.instantiateInitialViewController() as! UINavigationController
        myNav.title = "我的"
        myNav.tabBarItem.image = UIImage(named: "myinfo@2x")
        
        
        
        self.addChildViewController(nav1)
        self.addChildViewController(nav2)
        self.addChildViewController(nav3)
        self.addChildViewController(nav4)
        self.addChildViewController(myNav)
        
        let view = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 49))
       view.backgroundColor = UIColor(patternImage: UIImage(named: "pic_title_bg.9")!)
        self.tabBar.addSubview(view)
        

//        var array = NSMutableArray()
//        
//        for var a = 0;a < 5;++a{
//            
//            var image = UIImage(named: "home1@2x")
//            var item = UITabBarItem(title: nil, image: image, selectedImage: nil)
//            
//            array.addObject(item)
//            
//
//            
//            }
        
       

       
        
        
    }

    
}
