//
//  MoreModel.swift
//  test-01
//
//  Created by Mac on 15/12/2.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

import UIKit

class MoreModel: NSObject {
  
    var titleCn : String!;
    //导演名
    var directorName : String!;
    var img : String!;
//    简介
    var commonSpecial : String!;
    //电影院数
    var nearestCinemaCount : NSNumber!;
    var ratingFinal : NSNumber!;
    //上映月份
    var rMonth : NSNumber!;
//    上映日子
    var rDay : NSNumber!;
    
}


/*

{
    "movieId": 208253,
    "titleCn": "分歧者2：绝地反击",
    "titleEn": "Insurgent",
    "img": "http://img31.mtime.cn/mt/2015/05/31/153259.70730086_1280X720X2.jpg",
    "ratingFinal": 6.9,
    "length": 119,
    "directorName": "罗伯特·斯文克",
    "actorName1": "谢琳·伍德蕾",
    "actorName2": "提奥·詹姆斯",
    "type": "冒险 | 科幻 | 惊悚",
    "rYear": 2015,
    "rMonth": 6,
    "rDay": 19,
    "isNew": false,
    "isHot": false,
    "commonSpecial": "练练听力挺好的",
    "wantedCount": 3195,
    "is3D": true,
    "isIMAX": false,
    "isIMAX3D": true,
    "isDMAX": true,
    "nearestShowtime": {
        "nearestCinemaCount": 88,
        "nearestShowtimeCount": 280,
        "nearestShowDay": 1435708800,
        "isTicket": true
    }
}
*/