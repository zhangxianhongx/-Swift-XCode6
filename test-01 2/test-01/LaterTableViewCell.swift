//
//  LaterTableViewCell.swift
//  test-01
//
//  Created by Mac on 15/12/1.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

import UIKit

class LaterTableViewCell: UITableViewCell {

    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var imageV: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var classLabel: UILabel!
    
    
    @IBOutlet weak var artLabel: UILabel!
    
    var _model : MoreModel!;
    var model : MoreModel{
        
        set{
            
            _model = newValue
            
            
        }
        
        get{
            
            return _model;
        }
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.contentView.backgroundColor = UIColor(patternImage: UIImage(named: "home_top_movie_background_cover")!)
        
    }
    
    
    @IBAction func preButton(sender: AnyObject) {
    }
    
    
    @IBAction func preMovie(sender: AnyObject) {
    }
    
    
}
