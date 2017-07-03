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
  
  init(dictionary: NSDictionary) {
    name = dictionary["name"] as? String
    screenname = dictionary["screen_name"] as? String
    status = dictionary["description"] as? String
    imageURL = dictionary["profile_image_url_https"] as? String
    favorite_count = dictionary["favourites_count"] as? Int
  }
  
  class func TimeLines(array: [NSDictionary]) -> [TimeLine] {
    
    var TimeLines = [TimeLine]()
    for dictionary in array {
      let userType = dictionary["user"] as! NSDictionary
      let timeline = TimeLine(dictionary: userType)
      TimeLines.append(timeline)
    }
    homeTimeLines = TimeLines
    return TimeLines
  }


}


