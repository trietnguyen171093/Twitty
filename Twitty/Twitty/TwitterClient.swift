//
//  TwitterClient.swift
//  Twitty
//
//  Created by Triet on 7/2/17.
//  Copyright © 2017 Triet. All rights reserved.
//

import UIKit
import BDBOAuth1Manager


let consumeKey = "J2IJOZjGZ8rb28ZKuv8iD7NG1"
let comsumeSecret = "MgbTQvtFoXbWm4ESAt52QNLo5Ja1Tl0D59Nuqt7fGOd6VRfQUL"
let baseURL_ = URL(string: "https://api.twitter.com/")
var authenticate_ = false
class TwitterClient: BDBOAuth1SessionManager {

  static var shareInstance = TwitterClient(baseURL: baseURL_, consumerKey: consumeKey, consumerSecret :comsumeSecret)
  
  func getUserInfo() -> NSDictionary
  {
    var user = NSDictionary()
    _ = get("1.1/account/verify_credentials.json", parameters: nil, progress: nil, success: { (_: URLSessionDataTask, response: Any?) in
      if let response = response{
        user = response as! NSDictionary

      }
    }, failure: { (task: URLSessionDataTask?, error: Error) in
      print("\(error.localizedDescription)")
    })
    
    return user
  }
  
  func getHomeTimeLine(complete: @escaping ([TimeLine]?, Error?) -> Void) -> [NSDictionary]
  {
    print("get timeline")
    var hometimeline = [NSDictionary]()
    
    _ = get("1.1/statuses/home_timeline.json", parameters: nil, progress: nil, success: { (_: URLSessionDataTask, response: Any?) in
      
      if let response = response{
        hometimeline = response as! [NSDictionary]
        
        let abc = TimeLine.TimeLines(array: hometimeline)
        complete(abc, nil)
      }
    }, failure: { (task: URLSessionDataTask?, error: Error) in
      print("\(error.localizedDescription)")
      complete(nil, error)
    })
    return hometimeline
  }
  
  func authenticateSuccess(isSuccess: Bool) {
    authenticate_ = isSuccess
  }
  func isAuthenticateSuccess() -> Bool{
    return authenticate_
  }

}
