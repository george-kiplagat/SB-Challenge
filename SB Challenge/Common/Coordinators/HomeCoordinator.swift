//
//  HomeCoordinator.swift
//  SB Challenge
//
//  Created by George Kiplagat on 04/12/2022.
//

import Foundation
import UIKit

class HomeCoordinator : Coordinator {
    
    weak var parentCoordinator: Coordinator?
        
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
    
    func start() {
        
        let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        let homeViewModel = HomeViewModel.init()
        homeViewModel.appCoordinator = self
        homeViewModel.fetchRecentSearches()
        homeViewController.viewModel = homeViewModel
        navigationController.pushViewController(homeViewController, animated: true)
    
        
    }
    
    func goToProfile(username: String){
        
        let userProfileViewController = storyboard.instantiateViewController(withIdentifier: "UserProfileViewController") as! UserProfileViewController
        
        let userProfileViewModel = UserProfileViewModel.init(username: username)
        userProfileViewModel.appCoordinator = self
        userProfileViewController.viewModel = userProfileViewModel
        navigationController.pushViewController(userProfileViewController, animated: true)
    }
    
    func goToFollowersFollowing(username: String, action: FollowerAndFollowingViewModel.Action){
        
        let userProfileViewController = storyboard.instantiateViewController(withIdentifier: "FollowersAndFollowingsViewController") as! FollowersAndFollowingsViewController
        
        let followerAndFollowingViewModel = FollowerAndFollowingViewModel.init(username: username, action: action)
        followerAndFollowingViewModel.appCoordinator = self
        userProfileViewController.viewModel = followerAndFollowingViewModel
        navigationController.pushViewController(userProfileViewController, animated: true)
    }
    
    func goBack(){
        navigationController.popViewController(animated: true)
    }
    
}
