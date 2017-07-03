//
//  HomeTimeLine.swift
//  Twitty
//
//  Created by Triet on 7/2/17.
//  Copyright © 2017 Triet. All rights reserved.
//

import Foundation
import UIKit


class TimeLine : NSObject{
  
  let name : String?
  let screenname : String?
  let status : String?
  let favorite_count : Int?
  let imageURL : String?
  let timecreate: String?
  let retweetCount: Int?
  
  init(dictionary: NSDictionary) {
    
    status = dictionary["text"] as? String
    
    let userType = dictionary["user"] as! NSDictionary
    name = userType["name"] as? String
    screenname = userType["screen_name"] as? String
    imageURL = userType["profile_image_url_https"] as? String
    favorite_count = userType["favourites_count"] as? Int
    timecreate = dictionary["created_at"] as? String
    retweetCount = dictionary["retweet_count"] as? Int
  }
  
  class func TimeLines(array: [NSDictionary]) -> [TimeLine] {
    print("call class")
    var TimeLines = [TimeLine]()
    for dictionary in array {
      let timeline = TimeLine(dictionary: dictionary)
      TimeLines.append(timeline)
    }
    return TimeLines
  }
}


