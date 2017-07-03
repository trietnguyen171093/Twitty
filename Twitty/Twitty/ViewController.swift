//
//  ViewController.swift
//  Twitty
//
//  Created by Triet on 6/30/17.
//  Copyright © 2017 Triet. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class ViewController: UIViewController {
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    

      TwitterClient.shareInstance?.fetchRequestToken(withPath: "oauth/request_token", method: "POST", callbackURL: URL(string: "lauchTwitty1://"), scope: nil, success: { (response: BDBOAuth1Credential?) in
        if let response = response {
          print(response.token)
          
          let authURL = URL(string: "https://api.twitter.com/oauth/authenticate?oauth_token=\(response.token!)")
          
          UIApplication.shared.open(authURL!, options: [:], completionHandler: nil)
        }
      }, failure: { (error: Error?) in
        print("\(error?.localizedDescription)")
      })
    }
    
    // Do any additional setup after loading the view, typically from a nib.
  

  @IBAction func onLogin(_ sender: UIButton) {
    
    if (TwitterClient.shareInstance?.isAuthenticateSuccess())! {
      PerformSegue()
    }
    else{
      TwitterClient.shareInstance?.fetchRequestToken(withPath: "oauth/request_token", method: "POST", callbackURL: URL(string: "lauchTwitty1://"), scope: nil, success: { (response: BDBOAuth1Credential?) in
        if let response = response {
          print(response.token)
          
          let authURL = URL(string: "https://api.twitter.com/oauth/authenticate?oauth_token=\(response.token!)")
          
          UIApplication.shared.open(authURL!, options: [:], completionHandler: nil)
        }
      }, failure: { (error: Error?) in
        print("\(error?.localizedDescription)")
      })
    }
  }
  
  func PerformSegue()
  {
    self.performSegue(withIdentifier: "segueID", sender: self)
  }

  
}

