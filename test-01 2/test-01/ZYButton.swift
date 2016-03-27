//
//  ZYButton.swift
//  test-01
//
//  Created by Mac on 15/11/30.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

import UIKit

class ZYButton: UIView {

   
    var _buttonNameArray : NSArray!
    var buttonNameArray : NSArray{
        
        
        set{
            
            _buttonNameArray = newValue
            
            buttonNameArrayActon();
            
        }
        
        get{
            
            return _buttonNameArray
        }
        
    }
    var _buttonImageArray : NSArray!
    var buttonImageArray : NSArray{
        
        set{
            
            _buttonImageArray = newValue
            
            creatbuttonImageArray()
            
        }
        
        get{
            
            return _buttonImageArray
            
        }
        
    }
    
    var _selectedIndex : Int!
    var selectedIndex : Int{
        
        set{
            
            _selectedIndex = newValue;
            var button : UIButton = self.viewWithTag(20152914 + _selectedIndex) as! UIButton
            buttonAction(button)
            
        }
        get{
            
            return _selectedIndex;
        }
    }
    var oldTag : NSInteger!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        

        
      }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//swift  参数名：参数类型  返回值  ->返回的数据类型
   
    func buttonNameArrayActon(){

        var coun = _buttonNameArray.count
        
        for(var i = 0;i < coun ;i++){
            
            var width = self.bounds.size.width/CGFloat(coun)
            var x = CGFloat(i) * width
            var button = UIButton(frame: CGRectMake(x, 0, width, self.bounds.size.height))
            self.addSubview(button)
            button.tag = 20152914 + i
        
            button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            
            var name : NSString = _buttonNameArray.objectAtIndex(i) as NSString
            button.setTitle(name, forState: UIControlState.Normal)
            
            button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            button.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Selected)
            
            if(i == 0 ){
                
                oldTag = button.tag
                button.selected = true
                button.transform = CGAffineTransformMakeScale(1.2, 1.2)
            }
            
        }
        
        
    }
    
    func creatbuttonImageArray(){
        
        
        var coun = _buttonImageArray.count
        
        for(var i = 0;i < coun ;i++){
            
            var width = self.bounds.size.width/CGFloat(coun)
            var x = CGFloat(i) * width
            var button = UIButton(frame: CGRectMake(x, 0, width, self.bounds.size.height))
            self.addSubview(button)
            button.tag = 20152914 + i
            
            button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            
            var name : NSString = _buttonNameArray.objectAtIndex(i) as NSString
            
            button.setImage(UIImage(named: ""), forState: UIControlState.Normal);
            button.setImage(UIImage(named: ""), forState: UIControlState.Selected);
            
            
            
            if(i == 0 ){
                
                oldTag = button.tag
                button.selected = true
                button.transform = CGAffineTransformMakeScale(1.2, 1.2)
            }
            
        }

        
        
    }
    
    
    func buttonAction(button : UIButton){
        
        if(button.tag != oldTag){
            
            button.selected = !button.selected
            
            var button1 : UIButton = self.viewWithTag(oldTag) as UIButton
            button1.selected = false
            
            oldTag = button.tag
            
            button.transform = CGAffineTransformMakeScale(1.2, 1.2)
            button1.transform = CGAffineTransformMakeScale(1.0, 1.0)
            
            
        //传值与回调
      myFunc!(index: oldTag)
            
   
            
    }

}
    
    //必包
    typealias callbackfunc = (index : Int) -> Void
    var myFunc = callbackfunc?();
    
    //传递参数
    func initBack(mathFunction:(index : Int) -> Void){

        myFunc = mathFunction;
        
    }
    
    
    

}
