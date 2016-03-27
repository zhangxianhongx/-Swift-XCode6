//
//  LaterTableView.swift
//  test-01
//
//  Created by Mac on 15/12/1.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

import UIKit

class LaterTableView: UITableView ,UITableViewDelegate,UITableViewDataSource{

    var _dataArray : NSMutableArray!
    
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        self.dataSource = self;
        self.delegate = self;
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 130;
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 100;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("moreCell") as? LaterTableViewCell;
        
        if(cell == nil){
            
            cell = NSBundle.mainBundle().loadNibNamed("LaterTableViewCell", owner: self, options: nil).last as? LaterTableViewCell;
            
        }
        
        
        return cell!;
    }

    //解析数据
    func loadJson(){
        _dataArray = NSMutableArray();
        var path = NSBundle.mainBundle().pathForResource("home_header", ofType: "json")
        
        var data = NSData(contentsOfFile: path!)
        var dic1: NSDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: nil)! as NSDictionary
        
        var array : NSArray = dic1.objectForKey("movies")! as NSArray
        
        var imageNameDic = NSDictionary()
        
        for imageNameDic in array{
            var model : MoreModel = MoreModel()
            
        }
    }
    

}
