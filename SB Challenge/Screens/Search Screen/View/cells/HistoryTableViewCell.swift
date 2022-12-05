//
//  HistoryTableViewCell.swift
//  SB Challenge
//
//  Created by George Kiplagat on 04/12/2022.
//

import UIKit
import AlamofireImage

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        initView()
    }

    func initView(){
        self.userImageView.layer.cornerRadius = self.userImageView.frame.width/2
        
    }
    
    func setUserData(userData: UserDetailsModel) {
        
        if let url =  userData.avatarUrl {
            userImageView.setImage(withUrlString: url)
        }
        nameLabel.text = userData.name
        usernameLabel.text = userData.login
        
    }
}
