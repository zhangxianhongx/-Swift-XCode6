//
//  RatingView.swift
//  test-01
//
//  Created by Mac on 15/11/25.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

import UIKit

class RatingView: UIView {


    var _rating = NSNumber?()
    var rating:NSNumber{
        
        get{
            
            return self.rating
        }
        
        set{
            
            self._rating = newValue;
            
            var s = _rating?.floatValue
            //数据类型转换
            let sa = (CGFloat)(s!)
            var width1 = self.bounds.size.width * sa/10.0
            if(s < 0){
                return
            }
            
            
            //从外部改变黄色星星的大小
            yellowView?.frame = CGRectMake(0, 0, width1, self.bounds.size.height)
            
            
        }
        
    }
    
    var yellowView:UIView?
    var grayView:UIView?
    
    
  

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.clipsToBounds = true
        
        self.backgroundColor = UIColor.clearColor()
        //创建灰色星星和黄色星星的图片
        var grayImage = UIImage(named: "gray")
        var yellowimage = UIImage(named: "yellow")
        var width = grayImage?.size.width
        var height = grayImage?.size.height
        //创建盛放星星图片的视图
        grayView = UIView(frame: CGRectMake(0, 0, width!*5, height!))
        
        grayView?.backgroundColor = UIColor(patternImage: grayImage!)
        
        yellowView = UIView(frame: CGRectMake(0, 0, width!*5, height!))
        
        yellowView?.backgroundColor = UIColor(patternImage: yellowimage!)
        
        //放大灰色星星和黄色星星使其与自身view同大
        var VW = grayView?.bounds.size.width
        var scole = self.bounds.size.width/VW!
        
        var newTransform = CGAffineTransformMakeScale(scole, scole)
        grayView?.transform = newTransform
        yellowView?.transform = newTransform
        
        grayView?.frame = self.bounds
        yellowView?.frame = self.bounds
        self.addSubview(grayView!)
        self.addSubview(yellowView!)
        
    }

    

    
    
}
