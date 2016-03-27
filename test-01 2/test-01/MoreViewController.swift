//
//  MoreViewController.swift
//  test-01
//
//  Created by Mac on 15-11-23.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController ,UIScrollViewDelegate{

    var _scrollV : UIScrollView!
    var _nowTableView : NowTableView!
    var _laterTableView : LaterTableView!
    var _headButton : ZYButton!
    var buttonBgView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.automaticallyAdjustsScrollViewInsets = false
        //scrollView
        _scrollV = UIScrollView(frame: CGRectMake(0, 104, kScreenW, kScreenH - 40))
        self.view.addSubview(_scrollV)
        _scrollV.delegate = self;
        _scrollV.showsHorizontalScrollIndicator = false;
        _scrollV.showsVerticalScrollIndicator = false;
        _scrollV.bounces = false;
        _scrollV.pagingEnabled = true;
        _scrollV.contentSize = CGSizeMake(kScreenW * 2, _scrollV.bounds.size.height);
        
        
        //        nowTableView
        _nowTableView = NowTableView(frame: CGRectMake(0, 0, kScreenW, _scrollV.bounds.size.height) ,style : UITableViewStyle.Plain);

        _scrollV.addSubview(_nowTableView);
        
        //laterTableView
        _laterTableView = LaterTableView(frame: CGRectMake(kScreenW, 0, kScreenW, _scrollV.bounds.size.height) ,style : UITableViewStyle.Plain);
        _scrollV.addSubview(_laterTableView)
        
        //头部button
        _headButton = ZYButton(frame: CGRectMake(0, 64, kScreenW, 40))
        self.view.addSubview(_headButton)
        _headButton.buttonNameArray = ["正在热映","即将上映"];
        
        _headButton.initBack { (index) -> Void in
            var inde = index - 20152914;
            self.headButtonAction(inde)
            
        }
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_mtime_star.jpg")!)
        _headButton.backgroundColor = UIColor.clearColor()
        _scrollV.backgroundColor = UIColor.clearColor()
        _nowTableView.backgroundColor = UIColor.clearColor()
        _laterTableView.backgroundColor = UIColor.clearColor()
        
        var count = _headButton.buttonNameArray.count;
        buttonBgView = UIView(frame: CGRectMake(0, _headButton.bounds.size.height - 3, kScreenW/CGFloat(count), 3));
        _headButton.addSubview(buttonBgView);
        buttonBgView.backgroundColor = UIColor(patternImage: UIImage(named: "color_line")!);
    }
    
    //头部button调用的方法
    func headButtonAction(index : NSInteger){
        
        if(index == 0){
            
            UIView.animateWithDuration(0.35, animations: { () -> Void in
                
                self._scrollV.contentOffset = CGPointMake(0, self._scrollV.contentOffset.y)
                var count = self._headButton.buttonNameArray.count;
                self.buttonBgView.frame = CGRectMake(0, self._headButton.bounds.size.height - 3, kScreenW/CGFloat(count), 3);
                
            })
            
        }else if(index == 1){
            
            UIView.animateWithDuration(0.35, animations: { () -> Void in
                
                self._scrollV.contentOffset = CGPointMake(kScreenW, self._scrollV.contentOffset.y)
                var count = self._headButton.buttonNameArray.count;
                self.buttonBgView.frame = CGRectMake(kScreenW/CGFloat(count) * 1, self._headButton.bounds.size.height - 3, kScreenW/CGFloat(count), 3);
                
            })
            
        }
        
        
    }
    
    //delegate
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        var xff = scrollView.contentOffset.x/kScreenW;
        _headButton.selectedIndex = Int(xff)

        UIView.animateWithDuration(0.35, animations: { () -> Void in

            var count = self._headButton.buttonNameArray.count;
            self.buttonBgView.frame = CGRectMake(kScreenW/CGFloat(count) * xff, self._headButton.bounds.size.height - 3, kScreenW/CGFloat(count), 3);
            
        })

        
    }
   
}
