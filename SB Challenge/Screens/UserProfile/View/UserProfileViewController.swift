//
//  UserProfileViewController.swift
//  SB Challenge
//
//  Created by George Kiplagat on 03/12/2022.
//

import Foundation
import UIKit
import Lottie



class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var searchingView: UIStackView!
    @IBOutlet weak var animationView: LottieAnimationView!
    
    @IBOutlet weak var profileView: UIScrollView!
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioSeparatorView: UIView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var followersView: UIStackView!
    @IBOutlet weak var followingView: UIStackView!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var companyTextView: UITextView!
    @IBOutlet weak var blogTextView: UITextView!
    @IBOutlet weak var locationTextView: UITextView!
    @IBOutlet weak var emailTextView: UITextView!
    @IBOutlet weak var publicReposLabel: UILabel!
    
    var viewModel: UserProfileViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        loadData()
        
    }
    
    func initView(){
        
        self.animationView.loopMode = .loop
        self.animationView.animationSpeed = 2
        self.animationView.play()
        
        self.userImageView.layer.cornerRadius = self.userImageView.frame.height/2
        
        self.bioTextView.removeInsets()
        self.blogTextView.removeInsets()
        self.companyTextView.removeInsets()
        self.locationTextView.removeInsets()
        self.emailTextView.removeInsets()
        
        let followersTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleFollowersTapGesture(_:)))
        self.followersView.addGestureRecognizer(followersTapGesture)
        
        let followingTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleFollowingTapGesture(_:)))
        self.followingView.addGestureRecognizer(followingTapGesture)
        
    }

    
    @IBAction func back(_ sender: Any) {
        viewModel.goToPreviousScreen()
    }
    
    @objc func handleFollowersTapGesture(_ gesture: UITapGestureRecognizer) -> Void {
        viewModel.goToFollowersFollowing(action: .Followers, completionHandler: {[weak self] (message, success) in
            
            if !success {
                self?.showAlert(message!, dismissed: nil)
            }
            
        })
        
    }
    
    @objc func handleFollowingTapGesture(_ gesture: UITapGestureRecognizer) -> Void {
        viewModel.goToFollowersFollowing(action: .Following, completionHandler: {[weak self] (message, success) in
            
            if !success {
                self?.showAlert(message!, dismissed: nil)
            }
            
        })
    }
    
    
    func loadData() {
        
        self.viewModel.callService(completionHandler: {[weak self] (message, success) in
           if success {
               self?.searchingView.isHidden = true
               
               if let name = self?.viewModel.userDetails?.name{
                   self?.nameLabel.text = name
               }
               
               if let login = self?.viewModel.userDetails?.login{
                   self?.usernameLabel.text = login
               }
               
               if let bio = self?.viewModel.userDetails?.bio {
                   self?.bioTextView.text = bio
                   self?.bioTextView.isHidden = false
                   self?.bioSeparatorView.isHidden = false
               }
               
               if let followers = self?.viewModel.userDetails?.followers  {
                   self?.followersLabel.text = followers.formatNumber()
               }
               
               if let following = self?.viewModel.userDetails?.following{
                   self?.followingLabel.text = following.formatNumber()
               }
               
               if let company = self?.viewModel.userDetails?.company{
                   self?.companyTextView.text = company
               }
               
               if let location = self?.viewModel.userDetails?.location{
                   self?.locationTextView.text = location
               }
               
               if let email = self?.viewModel.userDetails?.email{
                   self?.emailTextView.text = email
               }
               
               if let blog = self?.viewModel.userDetails?.blog{
                   self?.blogTextView.text = blog
               }
               
               if let publicRepos = self?.viewModel.userDetails?.publicRepos{
                   self?.publicReposLabel.text = publicRepos.formatNumber()
               }
               
               
              
               if let url =  self?.viewModel.userDetails?.avatarUrl {
                   self?.userImageView.setImage(withUrlString: url)
               }
              
               self?.profileView.isHidden = false
               
           } else {
               
               self?.showAlert(message!, dismissed: {[weak self] (dismiss) in
                   self?.viewModel.goToPreviousScreen()
               })
           }
       })
    }
    
}
    

