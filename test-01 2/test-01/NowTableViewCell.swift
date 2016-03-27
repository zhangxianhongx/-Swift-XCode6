//
//  NowTableViewCell.swift
//  test-01
//
//  Created by Mac on 15/12/1.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

import UIKit

class NowTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var imageV: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var comLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
   
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var buyButton: UIButton!
    
   
    var _model : MoreModel!;
    var model : MoreModel{
        
        set{
            
            _model = newValue
            
            cellCottent()
            
        }
        
        get{
            
            return _model;
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
  
        self.contentView.backgroundColor = UIColor(patternImage: UIImage(named: "home_top_movie_background_cover")!)
        
    
    }
    
    //给cell复制内容
    func cellCottent(){
        
        ratingLabel.text = NSString(format: "%@", _model.ratingFinal) as String
        
        imageV.sd_setImageWithURL(NSURL(string: _model.img as String))
        titleLabel.text = _model.titleCn;
        comLabel.text = _model.commonSpecial;
        

        var day = _model.rDay.intValue;
      
        if( _model.rDay != nil){
    
           timeLabel.text = NSString(format: "本月%@日上映", _model.rDay) as String
            
        }

       countLabel.text = "168"
        
        buyButton.backgroundColor = UIColor.orangeColor();
        buyButton.layer.cornerRadius = buyButton.bounds.height/2
        
    }
    
    
    
    @IBAction func buyAction(sender: AnyObject) {
        
        
    }
    
    
    
}
