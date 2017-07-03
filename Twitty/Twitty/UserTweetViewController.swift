//
//  UserTweetViewController.swift
//  Twitty
//
//  Created by Triet on 7/3/17.
//  Copyright © 2017 Triet. All rights reserved.
//

import UIKit

class UserTweetViewController: UIViewController {

  @IBOutlet weak var avatarImage: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var screennameLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var mediaImage: UIImageView!
  @IBOutlet weak var retweetLabel: UILabel!
  @IBOutlet weak var likeLable: UILabel!
  var avatarURL : String?
  var hometimeline : TimeLine!
    override func viewDidLoad() {
      
      super.viewDidLoad()
      nameLabel.text =  hometimeline.name
      screennameLabel.text = hometimeline.screenname
      timeLabel.text = "Create at: " + hometimeline.timecreate!
      self.avatarURL = hometimeline.imageURL
      avatarImage.setImageWith(URL(string: avatarURL!)!)
      likeLable.text = "\(hometimeline.favorite_count!)" + " Likes"
      retweetLabel.text = "\(hometimeline.retweetCount!)" + " ReTweets"
      descriptionLabel.text = hometimeline.status
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

  @IBAction func onBack(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
