//
//  TweetViewController.swift
//  Twitter
//
//  Created by Nikhil Agrawal on 27/02/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var textViewTweet: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewTweet.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancleTweet(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tweet(_ sender: Any) {
        if(!textViewTweet.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: textViewTweet.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        }else{
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
