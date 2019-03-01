//
//  TweetCell.swift
//  Twitter
//
//  Created by Nikhil Agrawal on 27/02/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    
    @IBOutlet weak var reTweetButton: UIButton!
    var favourite: Bool = false
    var tweetId: Int =  -1
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    
    func setReTweeted(_ isRetweeted: Bool){
        
        if(isRetweeted){
            reTweetButton.setImage(UIImage(named:"retweet-icon-green" ), for: UIControl.State.normal)
            reTweetButton.isEnabled = false
        }else{
             reTweetButton.setImage(UIImage(named:"retweet-icon" ), for: UIControl.State.normal)
            reTweetButton.isEnabled = true
        }
    }
    
    
    func setFavourite(_ isFav:Bool){
        favourite = isFav
        if(favourite){
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }else{
             favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    
    @IBAction func actionFavTweet(_ sender: Any) {
        let toBeFavorited = !favourite
        
        if(toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success:{
               self.setFavourite(true)
                
            } , failure: { (error) in
                print("Fav did not succed")
            })
        }else{
            
            TwitterAPICaller.client?.unFavoriteTweet(tweetId: tweetId, success: {
                
                self.setFavourite(false)
                
            }, failure: { (error) in
               print("UNfav not succeded")
            })
        
     }
    
    }
    
    @IBAction func retweet(_ sender: Any) {
        
        TwitterAPICaller.client?.reTweet(tweetId: tweetId, success: {
            self.setReTweeted(true)
        }, failure: { (error) in
            print("Error in Retweeting")
        })
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
