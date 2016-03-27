//
//  NowTableView.swift
//  test-01
//
//  Created by Mac on 15/12/1.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

import UIKit

class NowTableView: UITableView ,UITableViewDelegate,UITableViewDataSource{

   
//    override func awakeFromNib() {
//    
//        super.awakeFromNib()
//        
//    }
    var _dataArray : NSMutableArray!;
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        loadJson()
        
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
        
        var coun = _dataArray.count;

        return coun;
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("moreCell") as? NowTableViewCell
        
        if(cell == nil){
            
            cell = NSBundle.mainBundle().loadNibNamed("NowTableViewCell", owner: self, options: nil).last as? NowTableViewCell;
            
        }
     
        let model : MoreModel = _dataArray.objectAtIndex(indexPath.row) as! MoreModel;
        cell?.model = model;
        
        return cell!;
        
    }
    
    //解析数据
    func loadJson(){
        _dataArray = NSMutableArray();
        let path = NSBundle.mainBundle().pathForResource("home_header", ofType: "json")
        
        let data = NSData(contentsOfFile: path!)
        let dic1: NSDictionary = try!NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
        
        let array : NSArray = dic1.objectForKey("movies")! as! NSArray
        
        var imageNameDic = NSDictionary()
        
        for imageNameDic in array{
            let model : MoreModel = MoreModel()
            
            let imageName : String = imageNameDic.objectForKey("img") as! String
            
            model.titleCn = imageNameDic.objectForKey("titleCn") as? String
            
            model.img = imageName
            
            model.ratingFinal = imageNameDic.objectForKey("ratingFinal") as? NSNumber
            
            model.commonSpecial = imageNameDic.objectForKey("commonSpecial")  as?  String
            model.rMonth = imageNameDic.objectForKey("rMoth") as? NSNumber
            model.rDay = imageNameDic.objectForKey("rDay") as? NSNumber
            model.nearestCinemaCount = imageNameDic.objectForKey("nearestCinemaCount") as? NSNumber;
            model.directorName = imageNameDic.objectForKey("directorName") as? String;

            _dataArray.addObject(model)
            
            
        }
        
    }
    
    
    
}
