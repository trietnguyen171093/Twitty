//
//  TwittyCell.swift
//  Twitty
//
//  Created by Triet on 7/2/17.
//  Copyright © 2017 Triet. All rights reserved.
//

import UIKit
import AFNetworking
class TwittyCell: UITableViewCell {

  @IBOutlet weak var avatarImage: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var screennameLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var statuslabel: UILabel!
  var avatarURL : String?
  
  var hometimeline : TimeLine!{
    didSet{
      nameLabel.text = hometimeline.name
      screennameLabel.text = hometimeline.screenname
      statuslabel.text = hometimeline.status
//      avatarImage.setImageWith(hometimeline.imageURL!)
      avatarURL = hometimeline.imageURL
      avatarImage.setImageWith(URL(string: avatarURL!)!)
    }
  }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
