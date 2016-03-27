//
//  VideoViewController.swift
//  test-01
//
//  Created by Mac on 15-11-23.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var newArray : NSArray!
    var dataArray : NSMutableArray!
    var _tableView : UITableView!
    var _headButton : ZYButton!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        
        loadJson()
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_mtime_star.jpg")!)
        
       
        
        _tableView = UITableView(frame: CGRectMake(0, 40, kScreenW, kScreenH - 40));
        _tableView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(_tableView)
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _headButton = ZYButton(frame: CGRectMake(0, 64, kScreenW, 40)) as ZYButton
        self.view.addSubview(_headButton)
        _headButton.backgroundColor = UIColor(patternImage: UIImage(named: "bg_mtime_star.jpg")!)
        _headButton.buttonNameArray = ["全部","附近","价格","筛选"];
        //外部调用
        _headButton.initBack({ (index) -> Void in
            
            var inde = index - 20152914;
            self.headButtonAction(inde);
            
        })
    
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 100;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        var coun = newArray?.count
        
        return coun!
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        
        var cell1 = tableView.dequeueReusableCellWithIdentifier("cell1") as? VideoTableViewCell
        
        if(cell1 == nil){
        
            cell1 = NSBundle.mainBundle().loadNibNamed("VideoTableViewCell", owner: self, options: nil).last as? VideoTableViewCell
            
        }
        
        var model : VideoModel = dataArray.objectAtIndex(indexPath.row) as VideoModel
        cell1?.model = model;

        cell1?.backgroundColor = UIColor.clearColor()
        return cell1!;
        
    }
    
    //点击头部按钮调用的方法
    func headButtonAction(index : NSInteger){
  
        //利用谓词检索
   
        if(index == 0){

            newArray = dataArray
            _tableView.reloadData()
            
            
        }
        
        if(index == 1){
            
            var predcate = NSPredicate(format: "hasIMAX!=0");
            
            newArray = dataArray.filteredArrayUsingPredicate(predcate!);
            _tableView.reloadData()
        }
        
        if(index == 2){
            
            var predcate = NSPredicate(format: "minPrice<30");
            
            newArray = dataArray.filteredArrayUsingPredicate(predcate!);
            _tableView.reloadData()
        }
        
        if(index == 3){
            
            var predcate = NSPredicate(format: "hasWifi!=0");
            
            newArray = dataArray.filteredArrayUsingPredicate(predcate!);
            _tableView.reloadData()
        }
        
    }
    
    
    
   //加载数据
    func loadJson(){
        
        dataArray = NSMutableArray()
        
        var path = NSBundle .mainBundle().pathForResource("cinema", ofType: "json");
        
        var data = NSData(contentsOfFile: path!)
        
        var array1: NSArray = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSArray
        
        var dic = NSDictionary()
        
        for dic in array1{
            
            var model : VideoModel = VideoModel()
            model.address = dic.objectForKey("address") as? NSString
            model.cinameName = dic.objectForKey("cinameName") as? NSString
            model.minPrice = dic.objectForKey("minPrice") as? NSNumber
            
            //图片字典
            var dic1 : NSDictionary = dic.objectForKey("feature") as NSDictionary
            model.has3D = dic1.objectForKey("has3D") as? NSNumber
            model.hasPark = dic1.objectForKey("hasPark") as? NSNumber
            model.hasFeature4D = dic1.objectForKey("hasFeature4D") as? NSNumber
            model.hasIMAX = dic1.objectForKey("hasIMAX") as? NSNumber
            model.hasWifi = dic1.objectForKey("hasWifi") as? NSNumber

            dataArray.addObject(model)
            
        }
            newArray = dataArray
        
    }
   


}
