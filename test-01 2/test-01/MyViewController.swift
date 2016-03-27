//
//  MyViewController.swift
//  test-01
//
//  Created by Mac on 15-11-23.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

import UIKit

class MyViewController: UITableViewController ,UIAlertViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.backgroundColor = UIColor(patternImage: UIImage(named: "bg_mtime_star.jpg")!)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    

        
        
        func selectRowAtIndexPath(indexPath: NSIndexPath?, animated: Bool, scrollPosition: UITableViewScrollPosition){

            if(indexPath?.item == 0){
                
                var alertV = UIAlertView(title: "清除缓存", message: "是否清除", delegate: self, cancelButtonTitle: "确定")
                
                alertV.show()
                
            }
            
        }
        
    
    
    //代理方法
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        if(buttonIndex == 1){
        //清除缓存
        
        
    }
    
    }
    
    
}
