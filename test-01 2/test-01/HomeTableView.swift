//
//  HomeTableView.swift
//  test-01
//
//  Created by Mac on 15/11/24.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

import UIKit

class HomeTableView: UITableView,UITableViewDelegate,UITableViewDataSource{

    
//定义属性 并重写set 和 get方法
    
    var _dataArray : NSArray?
    
    var dataArray : NSArray{
        
        
        set{
            
            self._dataArray = newValue

//            println("\(self._dataArray!)")
            self.reloadData()
        }
        get{
            
            return self._dataArray!
        }

        
    }
    
    
  
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.delegate = self
        self.dataSource = self

        
        
    }
    

    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    
        var aa = _dataArray?.count
        
        if(aa == nil){
            
            
            return 0;
        }
        
        return aa!
    
    
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as? HomeTableViewCell
        
        if(cell == nil){
            
            cell = NSBundle.mainBundle().loadNibNamed("HomeTableViewCell", owner: self, options: nil).last as? HomeTableViewCell
            
            
        }
        
        cell?.backgroundColor = UIColor.clearColor()
        
        cell?.model = _dataArray![indexPath.row] as HomeModel
        
        return cell!
    }
    
    
    //cell的点击方法
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        println("点击了第\(indexPath.row)个单元格")
        
    }
    
    
}
