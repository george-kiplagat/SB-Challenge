//
//  FollowersAndFollowingsTableViewCell.swift
//  SB Challenge
//
//  Created by George Kiplagat on 04/12/2022.
//

import UIKit
import AlamofireImage

class FollowersAndFollowingsTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        initView()
    }
    
    func initView(){
        self.userImageView.layer.cornerRadius = self.userImageView.frame.height/2
    }

    func setUserData(userData: User) {
        
        if let url =  userData.avatarUrl as? String {
            userImageView.setImage(withUrlString: url)
        }
        usernameLabel.text = userData.login
        
    }

}
