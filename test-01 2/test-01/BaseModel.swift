//
//  BaseModel.swift
//  test-01
//
//  Created by Mac on 15/11/26.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

import UIKit

class BaseModel: NSObject {
   
    var _map = NSDictionary?()
    
    var map : NSDictionary{
        
        set{
            
            _map = newValue
            
            
            
        }
        
        get{
            
            return _map!
        }
        
        
    }

    override init() {
        super.init()
        
        
        
    }
    
    
    
    
    func setAtribute(dic:NSDictionary){
        
        
        
    }
    
    
    
}
