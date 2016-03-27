//
//  VideoTableViewCell.swift
//  test-01
//
//  Created by Mac on 15/12/1.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    var _model = VideoModel()
    
    var model : VideoModel{
        
        set{
            
            _model = newValue;
            
            cellOfsubViews()
            
        }
        
        get{
            
            return _model
        }
        
    }
    
    
    func cellOfsubViews(){
        
        countLabel.text = _model.address
        titleLabel.text = _model.cinameName
        
        var price = _model.minPrice?.floatValue
        
        priceLabel.text = NSString(format: "%.2f", price!/100)

        var has3D = _model.has3D?.intValue
        var has4D = _model.hasFeature4D?.intValue
        var hasWifi = _model.hasWifi?.intValue
        var hasIMAX = _model.hasIMAX?.intValue
        var hasPark = _model.hasPark?.intValue
        
        var imageVC = self.contentView.viewWithTag(20151218) as? UIImageView
        
 
        
        var imageArray = NSMutableArray()
        imageArray.removeAllObjects()
        var item : Int = 0;
        
        if(has3D == 1){
        
            
            var image = UIImage(named: "v10_18_Feature3D@2x")
            if(image != nil){

                imageArray.addObject(image!)
                item = item + 1;

            }
        }
        
        if(has4D == 1){
    
            var image = UIImage(named: "v10_18_serviceTicket3D@2x")
            
            if(image != nil){
                
                imageArray.addObject(image!)
                item = item + 1;
                
            }
            
            
        }
        
        if(hasPark == 1){
          
            var image = UIImage(named: "v10_18_park@2x")
            if(image != nil){
                
                imageArray.addObject(image!)
                item = item + 1;
                
            }
            
        }
        
        if(hasIMAX == 1){
       
            var image = UIImage(named: "v10_18_FeatureIMAX@2x")
            if(image != nil){

                imageArray.addObject(image!)
                item = item + 1;
            }
            
        }
        
        if(hasWifi == 1){
       
            var image = UIImage(named: "v10_18_wifi@2x")
            if(image != nil){

                imageArray.addObject(image!)
                item = item + 1;
                
            }
           
        }
        
        for(var i = 0;i < item; ++i){
            
            var x = i * 40
            var imageV = UIImageView(frame: CGRectMake(CGFloat(x), 68, 30, 30))
            
            imageV.tag = 20151218;
            
            var image : UIImage = imageArray.objectAtIndex(i) as UIImage

            imageV.image = image;
            
            self.contentView.addSubview(imageV)
            
        }
        
        
        
    }
    
    
}
