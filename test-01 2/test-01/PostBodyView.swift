//
//  PostBodyView.swift
//  test-01
//
//  Created by Mac on 15/11/27.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

import UIKit

class PostBodyView: UIView ,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    var _dataArray : NSArray?
    
    var dataArray : NSArray{
        
        
        set{
            
            self._dataArray = newValue
            
            _collectionView.reloadData()
        }
        get{
            
            return self._dataArray!
        }
        
        
    }

    
    
    var _collectionView : UICollectionView!
    var index : Int!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        creatCollectionView()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func creatCollectionView(){
        
        var layout = UICollectionViewFlowLayout()
        //水平显示
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        //item的大小
        layout.itemSize = CGSizeMake(kScreenW-100, kScreenH - 30 - 49)
        //设置边距
        layout.sectionInset = UIEdgeInsetsMake(0, 50, 0, 50)
        //item垂直间的距离
//        layout.minimumInteritemSpacing = 0.0
//        //item水平间的距离
//        layout.minimumLineSpacing = 10
        //头视图
//        layout.headerReferenceSize = CGSizeMake(50, kScreenH - 30 - 49)
//        layout.footerReferenceSize = CGSizeMake(50, kScreenH - 30 - 49)
        
        _collectionView = UICollectionView(frame: CGRectMake(0, 0, kScreenW, kScreenH - 30 - 49),collectionViewLayout : layout)
        
        _collectionView?.delegate = self;
        _collectionView?.dataSource = self;
        _collectionView?.alwaysBounceHorizontal = false
        _collectionView?.alwaysBounceVertical = false
//        _collectionView.pagingEnabled = true
        
        self.addSubview(_collectionView!)
        //注册单元格
        _collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "item")
        
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        var countS = _dataArray?.count
        
        
        return countS!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
        var cell : UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("item", forIndexPath: indexPath) as UICollectionViewCell
        
        var model = _dataArray?.objectAtIndex(indexPath.item) as HomeModel
        
        var image1 : UIImageView?
        
        if((image1) == nil){
            
            image1 = UIImageView(frame: CGRectMake(0, 64, cell.bounds.size.width, kScreenH - 64 - 49))
            cell.contentView.addSubview(image1!)
            image1?.sd_setImageWithURL(NSURL(string: model.img!))
            image1?.tag = 20152520
            
        }else{
            
            var image1 : UIImageView = self.viewWithTag(20152020) as UIImageView
            image1.sd_setImageWithURL(NSURL(string: model.img!))
        }
        
        
        
        return cell
    }

    
    
//代理方法
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
       
        //获得滚动结束之后的单元格的偏移量
        var xffset = scrollView.contentOffset.x
        
        //根据偏移量获取单元格的距离
        var newIndex = (xffset + (kScreenW - 100)/2)/(kScreenW - 100)
        //强制转换
        var nIndex : Int = Int(newIndex)
//        println("\(newIndex)")
//        println("\(nIndex)")
        
        
        var countS = _dataArray?.count
        if(nIndex  >= countS! - 1){
        
            nIndex = 14
        }
        
        if(nIndex <= 0){
            
            nIndex = 0
        }
        
        index = nIndex
        
        //根据位置设置显示的单元格
        scrollView.contentOffset.x = CGFloat(nIndex) * (kScreenW - 100) + CGFloat(nIndex) * 10

  
    }
  
    
    
    
    
}
