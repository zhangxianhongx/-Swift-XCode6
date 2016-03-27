//
//  HomeHeadView.swift
//  test-01
//
//  Created by Mac on 15-11-24.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

import UIKit

class HomeHeadView: UIView,UIScrollViewDelegate {
    
    var _scrollView : UIScrollView!
    var _leftImageV : UIImageView!
    var _centerImageV : UIImageView!
    var _ringtImageV : UIImageView!
    //电影名
    var _titleLabel : UILabel!
    //预告
    var _advanceLabel : UILabel!
    //电影简介
    var _contentLabel : UILabel!
    //热映数
    var _countLeft : UILabel!
    //即将上映数
    var _countRight : UILabel!
    //影院数
    var _countCenter : UILabel!
//    热映
    var _leftButton : UIButton!
//    即将上映
    var _centerButton : UIButton!
//    找影院
    var _rightButton : UIButton!
    //图片index
    var centerIndex : Int!
    var leftIndex : Int!
    var rightIndex : Int!
//自定义UIView重写init方法
    override init(frame:CGRect){
        
        super.init(frame:frame)

        
        
    }
    

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var _dataArray:NSArray?
    var dataArray:NSArray{
        
        set{
            
            _dataArray = newValue
            
            creatSubViews()
            
        }
        
        get{
            
            return _dataArray!
        }
        
    }
    
    
    
    func creatSubViews(){
        //创建scrollView
        _scrollView = UIScrollView(frame: CGRectMake(0, 0, kScreenW, 150))
        self.addSubview(_scrollView)
        _scrollView.contentSize = CGSizeMake(kScreenW+200, 150)
        _scrollView.showsHorizontalScrollIndicator = false
        _scrollView.showsVerticalScrollIndicator = false
        _scrollView.bounces = false
        _scrollView.delegate = self
        
        _centerImageV = UIImageView(frame: CGRectMake(kScreenW/2 - 120/2+100, 0, 120, 150))
        _scrollView.addSubview(_centerImageV)
        _leftImageV = UIImageView(frame: CGRectMake(kScreenW/2+50+60+100, 25, 80, 100))
        _scrollView.addSubview(_leftImageV)
        _ringtImageV = UIImageView(frame: CGRectMake(kScreenW/2-120/2-50, 25, 80, 100))
        _scrollView.addSubview(_ringtImageV)
        _scrollView.contentOffset = CGPointMake(100, 0)
    
        centerIndex = 0
        
        var oldCount = _dataArray?.count
//        let sa = (CGFloat)(oldCount!)
        leftIndex = oldCount! - 1
        rightIndex = 1

        var model1 = _dataArray?.firstObject as HomeModel
        _centerImageV.sd_setImageWithURL(NSURL(string: model1.img!))
        
        var model2 = _dataArray?.objectAtIndex(leftIndex) as HomeModel
        _leftImageV.sd_setImageWithURL(NSURL(string: model2.img!))

        var model3 = _dataArray?.objectAtIndex(rightIndex) as HomeModel
        _ringtImageV.sd_setImageWithURL(NSURL(string: model3.img!))
        
        
        
        
        
        creatLabel()
        
        
    }
    
    func creatLabel(){
       //简介 影名
        var model1 = _dataArray?.firstObject as HomeModel
        _centerImageV.sd_setImageWithURL(NSURL(string: model1.img!))
        
        _titleLabel = UILabel(frame: CGRectMake(0, _scrollView.bounds.size.height, kScreenW, 30))
        _titleLabel.textColor = UIColor.whiteColor()
        _titleLabel.textAlignment = NSTextAlignment.Center
        self.addSubview(_titleLabel)
        _titleLabel.text = model1.titleCn
        
       
        _advanceLabel = UILabel(frame: CGRectMake(kScreenW/2-50, _scrollView.bounds.size.height+30, 100, 30))
        self.addSubview(_advanceLabel)
        _advanceLabel.backgroundColor = UIColor.orangeColor()
        _advanceLabel.textAlignment = NSTextAlignment.Center
        _advanceLabel.textColor = UIColor.whiteColor()
        _advanceLabel.text = "预告"
        _advanceLabel.layer.cornerRadius = 15
        _advanceLabel.clipsToBounds = true
        
       
        _contentLabel = UILabel(frame: CGRectMake(0, _scrollView.bounds.size.height+60, kScreenW, 30))
        self.addSubview(_contentLabel)
        _contentLabel.textAlignment = NSTextAlignment.Center
        _contentLabel.textColor = UIColor.whiteColor()
        _contentLabel.text = model1.commonSpecial

        
//        热映
        _countLeft = UILabel(frame: CGRectMake(0, _scrollView.bounds.size.height+90, 100, 30))
        self.addSubview(_countLeft)
        _countLeft.textAlignment = NSTextAlignment.Center
        _countLeft.textColor = UIColor.whiteColor()
        _countLeft.text = "113"
        var _countButtonLeft = UIButton(frame: CGRectMake(0, _scrollView.bounds.size.height+120, 80, 30))
        self.addSubview(_countButtonLeft)
        _countButtonLeft.setTitle("正在热映", forState: UIControlState.Normal)
        
        var _countButton1 = UIButton(frame: CGRectMake(80, _scrollView.bounds.size.height+120, 30, 30))
        _countButton1.setImage(UIImage(named: "profile_right_arrow"), forState: UIControlState.Normal)
        self.addSubview(_countButton1)
        _countButtonLeft.addTarget(self, action: "leftButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        _countButton1.addTarget(self, action: "leftButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)
      
        
        //即将上映
        _countCenter = UILabel(frame: CGRectMake(kScreenW/2 - 50, _scrollView.bounds.size.height+90, 100, 30))
        self.addSubview(_countCenter)
        _countCenter.textAlignment = NSTextAlignment.Center
        _countCenter.textColor = UIColor.whiteColor()
        _countCenter.text = "225"
        var _countButtoncenter = UIButton(frame: CGRectMake(kScreenW/2-55, _scrollView.bounds.size.height+120, 80, 30))
        self.addSubview(_countButtoncenter)
        _countButtoncenter.setTitle("即将上映", forState: UIControlState.Normal)
        
        var _countButton2 = UIButton(frame: CGRectMake(kScreenW/2+25, _scrollView.bounds.size.height+120, 30, 30))
        _countButton2.setImage(UIImage(named: "profile_right_arrow"), forState: UIControlState.Normal)
        self.addSubview(_countButton2)
        _countButtoncenter.addTarget(self, action: "centerButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        _countButton2.addTarget(self, action: "centerButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
      //找影院
        _countRight = UILabel(frame: CGRectMake(kScreenW-100, _scrollView.bounds.size.height+90, 100, 30))
        self.addSubview(_countRight)
        _countRight.textAlignment = NSTextAlignment.Center
        _countRight.textColor = UIColor.whiteColor()
        _countRight.text = "56"
        var _countButtonright = UIButton(frame: CGRectMake(kScreenW-110, _scrollView.bounds.size.height+120, 80, 30))
        self.addSubview(_countButtonright)
        _countButtonright.setTitle("找影院", forState: UIControlState.Normal)
        
        var _countButton3 = UIButton(frame: CGRectMake(kScreenW-30, _scrollView.bounds.size.height+120, 30, 30))
        _countButton3.setImage(UIImage(named: "profile_right_arrow"), forState: UIControlState.Normal)
        self.addSubview(_countButton3)
        _countButtonright.addTarget(self, action: "rightButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        _countButton3.addTarget(self, action: "rightButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
    }
    
    
    //热映按钮调用的方法
    func leftButtonAction(button:UIButton){
        
        println("点击了热映按钮")
        
    }
    //即将上映按钮调用的方法
    func centerButtonAction(button:UIButton){
        
        println("点击了即将上映按钮")
    }
    //找影院按钮调用的方法
    func rightButtonAction(button:UIButton){
        
        println("点击了找影院按钮")
        
    }
    
    //scrollView的代理方法
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {

        var oldCount = _dataArray?.count
        if(scrollView.contentOffset.x < 110){

           var centerIn = centerIndex;
           var leftIn = leftIndex;
           var rightIn = rightIndex;
           
           centerIn = centerIn + 1;
           leftIn = leftIn + 1;
           rightIn = rightIn + 1;
           
           if(centerIn > oldCount! - 1){
            
               centerIn = 0;
            
           }
           
           if(leftIn > oldCount! - 1){
               leftIn = 0;
            
           }
           if(rightIn > oldCount! - 1){
           
           rightIn = 0;
            
        }
        
           centerIndex = centerIn;
           leftIndex = leftIn;
           rightIndex = rightIn;
        
            var model1 = _dataArray?.objectAtIndex(centerIndex) as HomeModel
            _centerImageV.sd_setImageWithURL(NSURL(string: model1.img!))
            
            var model2 = _dataArray?.objectAtIndex(leftIndex) as HomeModel
            _leftImageV.sd_setImageWithURL(NSURL(string: model2.img!))
            
            var model3 = _dataArray?.objectAtIndex(rightIndex) as HomeModel
            _ringtImageV.sd_setImageWithURL(NSURL(string: model3.img!))

            scrollView.contentOffset = CGPointMake(100, 0)
            _contentLabel.text = model1.commonSpecial
            _titleLabel.text = model1.titleCn
            
           }
    
        
        if(scrollView.contentOffset.x > 150){
            
            var centerIn = centerIndex;
            var leftIn = leftIndex;
            var rightIn = rightIndex;
            
            centerIn = centerIn - 1;
            leftIn = leftIn - 1;
            rightIn = rightIn - 1;
            
            if(centerIn < 0){
                
                centerIn = oldCount! - 1;
                
            }
            
            if(leftIn < 0){
                leftIn = oldCount! - 1;
                
            }
            if(rightIn < 0){
                
                rightIn = oldCount! - 1;
                
            }
    
            centerIndex = centerIn;
            leftIndex = leftIn;
            rightIndex = rightIn;
    
            var model1 = _dataArray?.objectAtIndex(centerIndex) as HomeModel
            _centerImageV.sd_setImageWithURL(NSURL(string: model1.img!))
            
            var model2 = _dataArray?.objectAtIndex(leftIndex) as HomeModel
            _leftImageV.sd_setImageWithURL(NSURL(string: model2.img!))
            
            var model3 = _dataArray?.objectAtIndex(rightIndex) as HomeModel
            _ringtImageV.sd_setImageWithURL(NSURL(string: model3.img!))
            
            scrollView.contentOffset = CGPointMake(100, 0)
            _contentLabel.text = model1.commonSpecial
            _titleLabel.text = model1.titleCn
        }

        
        
        
    }
    
    
    
    
    
}
