//
//  PostView.swift
//  test-01
//
//  Created by Mac on 15/11/27.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

import UIKit

class PostView: UIView {

    var _dataArray : NSArray?
    
    var dataArray : NSArray{
        
        
        set{
            
            self._dataArray = newValue
            
            postHeadView.dataArray = _dataArray!
            postbodyView.dataArray = _dataArray!
            
            
            //添加监听
            postHeadView.addObserver(self, forKeyPath: "index", options: NSKeyValueObservingOptions.New, context: nil)
            
            postbodyView.addObserver(self, forKeyPath: "index", options: NSKeyValueObservingOptions.New, context: nil)
            
        }
        get{
            
            return self._dataArray!
        }
        
        
    }

    
    var postHeadView : PostHeadView!
    var postbodyView : PostBodyView!
    var bgView : UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
  
        self.backgroundColor = UIColor(patternImage: UIImage(named: "bg_mtime_star.jpg")!)
        //创建身体视图
        postbodyView = PostBodyView(frame: CGRectMake(0, 64, kScreenW, kScreenH - 49-64))
        
        self.addSubview(postbodyView)
        
        //头部视图
        postHeadView = PostHeadView(frame: CGRectMake(0, 64-120, kScreenW, 150))
        postHeadView.backgroundColor = UIColor.clearColor()
        self.addSubview(postHeadView)
        
        //头部视图背景图
        bgView = UIImageView(frame: CGRectMake(0, 120, kScreenW, 30))
        postHeadView.addSubview(bgView)
        postHeadView.userInteractionEnabled = true
        postHeadView.userInteractionEnabled = true
        bgView.image = UIImage(named: "indexBG_home")
        
        //创建背景图上的三角按钮
        let Sbutton = UIButton(frame: CGRectMake(kScreenW/2-10, 120, 30, 30))
        Sbutton.setImage(UIImage(named: "down_home@2x"), forState: UIControlState.Normal)
        postHeadView.addSubview(Sbutton)
        
        Sbutton.setImage(UIImage(named: "up_home@2x"), forState: UIControlState.Highlighted)
        Sbutton.setImage(UIImage(named: "up_home@2x"), forState: UIControlState.Selected)
        Sbutton.addTarget(self, action: "bgViewSbuttonActin:", forControlEvents: UIControlEvents.TouchUpInside)
        Sbutton.enabled = true
        Sbutton.tag = 20152914
        
       //创建手势
        let swipdown = UISwipeGestureRecognizer(target: self, action: "swipAction:")
        swipdown.direction = UISwipeGestureRecognizerDirection.Down
        self.addGestureRecognizer(swipdown)
        
        let swopUp = UISwipeGestureRecognizer(target: self, action: "swipAction:")
        swopUp.direction = UISwipeGestureRecognizerDirection.Up
        self.addGestureRecognizer(swopUp)
        
        
        
        
       
        
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    

//bgView上的三角按钮调用的方法
    func bgViewSbuttonActin(button:UIButton){
        
        button.selected = !button.selected
        UIView.animateWithDuration(0.35, animations: { () -> Void in
            
            
            if(button.selected == true){
                
                self.postHeadView.frame = CGRectMake(0, 64, kScreenW, self.postHeadView.bounds.size.height)
                
            }else{
                
                self.postHeadView.frame = CGRectMake(0, 64-120, kScreenW, self.postHeadView.bounds.size.height)
            }
            
            
            }) { (Bool) -> Void in
   
        }

        
    }
    
    
    //手势调用的方法
    func swipAction(swip : UISwipeGestureRecognizer){
        
        let button = postHeadView.viewWithTag(20152914) as! UIButton
        
        switch(swip.direction){
        case(UISwipeGestureRecognizerDirection.Down):
            
            button.selected = true
            postbodyView._collectionView.userInteractionEnabled = false
            postbodyView._collectionView.alpha = 0.7
            
            break;
            
        default:
            button.selected = false
            postbodyView._collectionView.userInteractionEnabled = true
            postbodyView._collectionView.alpha = 1
            
            break;
            
        }
        
        
        UIView.animateWithDuration(0.35, animations: { () -> Void in
            
            
            if(button.selected == true){
                
                self.postHeadView.frame = CGRectMake(0, 64, kScreenW, self.postHeadView.bounds.size.height)
                
                
            }else{
                
                self.postHeadView.frame = CGRectMake(0, 64-120, kScreenW, self.postHeadView.bounds.size.height)
            }
            
            
            }) { (Bool) -> Void in
                
                
                
        }
        
        
    }
    
    
    //监听调用的方法  不走此方法
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        if(keyPath == "index"){
            
            let dic = change! as NSDictionary
            let indexNum = dic.objectForKey("new") as! NSNumber
            
            var index : Int = Int(indexNum.intValue)
            let countS = _dataArray?.count
            if(index  >= countS! - 1){
                
                index = countS!
            }
            
            let indexPath = NSIndexPath(forItem: index, inSection: 0)
            
            if(object!.isKindOfClass(PostHeadView.self)){
                
                postbodyView._collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
                postbodyView.index = index
                
                
            }
            
            if(object!.isKindOfClass(PostBodyView.self)){
                
                postHeadView._collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
                postHeadView.index = index
                
                
            }
            
        }
        

    }
    
   
    
    
    
    
    
    
    
    
}
