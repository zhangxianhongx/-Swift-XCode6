//
//  HomeViewController.swift
//  test-01
//
//  Created by Mac on 15-11-23.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

import UIKit

let kScreen = UIScreen.mainScreen().bounds
let kScreenW = UIScreen.mainScreen().bounds.size.width
let kScreenH = UIScreen.mainScreen().bounds.size.height

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableVc: HomeTableView!
    
    //反面视图
    var postView : PostView!
    
    var _dataArray = NSMutableArray()
    var _imageArray = NSMutableArray()
   
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        
        loadData()
        
    }
        required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var headView = HomeHeadView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 350))

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_mtime_star.jpg")!)
        tableVc.tableHeaderView = headView
        tableVc.backgroundColor = UIColor.clearColor()
        headView.backgroundColor = UIColor.clearColor()

        tableVc.dataArray = _dataArray

        headView.dataArray = _dataArray
        
        postView = PostView(frame: kScreen)
        postView.hidden = true
        self.view.addSubview(postView)
        
        postView.dataArray = _dataArray
        
        addPostButton()
    }
    
    
    //添加navigtinBar上的界面翻转按钮
    func addPostButton(){
        
        var postButton = UIButton(frame: CGRectMake(0, 0, 40, 40))
        postButton.setImage(UIImage(named: "list_home"), forState: UIControlState.Normal)
        postButton.addTarget(self, action: "postButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        var rightItem = UIBarButtonItem(customView: postButton)
        self.navigationItem.rightBarButtonItem = rightItem
        
        
    }
    
    //翻转按钮调用的方法
    func postButtonAction(button:UIButton){
        
        button.selected = !button.selected
        postView.hidden = !button.selected
        var transL = UIViewAnimationTransition.FlipFromLeft
        var transR = UIViewAnimationTransition.FlipFromRight
        
        if(button.selected == true){
            
            UIView.animateWithDuration(0.35, animations: { () -> Void in
                
                UIView.setAnimationTransition(transL, forView: self.view, cache: true)
                self.navigationController?.navigationBar.alpha = 0.3
                self.navigationItem.title = nil;
            })
            
        }else{
            
            UIView.animateWithDuration(0.35, animations: { () -> Void in
                
                UIView.setAnimationTransition(transR, forView: self.view, cache: true)
                self.navigationController?.navigationBar.alpha = 1.0
                self.navigationItem.title = "home"
            })
  
        }
  
    }
    
    
//读取json数据
    
    func loadData(){
        
        var pat = NSBundle.mainBundle().pathForResource("home_header", ofType: "json")
        
        var data = NSData(contentsOfFile: pat!)
        
        var dic1: NSDictionary = try?NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: nil)! as NSDictionary
        
        var array : NSArray = dic1.objectForKey("movies")! as! NSArray
        
        var imageNameDic = NSDictionary()
        
        for imageNameDic in array{
            
            var model : HomeModel = HomeModel()
            
            var imageName : String = imageNameDic.objectForKey("img") as! String
            
            model.titleCn = imageNameDic.objectForKey("titleCn") as? String
            
            model.img = imageName
            
            model.ratingFinal = imageNameDic.objectForKey("ratingFinal") as? NSNumber
            
            model.commonSpecial = imageNameDic.objectForKey("commonSpecial")  as?  String
            
            _dataArray.addObject(model)
            _imageArray.addObject(imageName)
            
        }
        
        
    }
    
    

}
