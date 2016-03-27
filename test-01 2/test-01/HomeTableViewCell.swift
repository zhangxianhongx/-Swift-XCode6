//
//  HomeTableViewCell.swift
//  test-01
//
//  Created by mac on 15/11/26.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    var _model = HomeModel?()
    var model:HomeModel{
        
        set{
            
            self._model = newValue;
            titleLabel.text = _model?.titleCn
            let str = _model?.ratingFinal;
            //字符串的拼接
            countL.text = NSString(format: "%@", str!) as String
            
            let ra = _model?.ratingFinal
            //传值
            ratingV.rating = ra!
            
            let urlString = _model?.img
            let imageUrl = NSURL(string: urlString!)
            imageV.sd_setImageWithURL(imageUrl)
            
        }
        
        get{
            
        return self._model!
            
        }
        
    }
    
    
    @IBOutlet weak var imageV: UIImageView!
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var ratingV: RatingView!
    
    
    @IBOutlet weak var countL: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        
        self.selectionStyle = UITableViewCellSelectionStyle.None
        self.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
        
        
    }
    
}
