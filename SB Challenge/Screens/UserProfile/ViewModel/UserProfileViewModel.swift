//
//  UserProfileViewModel.swift
//  SB Challenge
//
//  Created by George Kiplagat on 03/12/2022.
//

import Foundation

class UserProfileViewModel: NSObject {
    
    weak var appCoordinator : HomeCoordinator!
    var username: String!

    var profileLoaded: ((UserDetailsModel?, String, Bool) -> Void)?
    var userDetails: UserDetailsModel?
    
    func goToPreviousScreen(){
        appCoordinator.goBack()
    }
   
    init(username: String) {
        super.init()
        self.username = username
    }
    
    func callService(completionHandler: ((String?, Bool) -> Void)?) {
        
        if (NetworkManager.isConnectedToNetwork()){
            
            ApiManager.shared.search(
                username: self.username,
                success: { [weak self] response in
                    self?.userDetails = response
                    DatabaseManager.shared.replace(profile: response)
                    completionHandler?(nil, true)
                },
                fail: { [weak self] error in
                    completionHandler?(error , false)
                })
        } else if (DatabaseManager.shared.searchProfile(username: username).count>0){
            self.userDetails = DatabaseManager.shared.fetchProfile(username: username)
            completionHandler?(nil, true)
        } else {
            completionHandler?("An error occurred while processing your request" , false)
        }
        
    }
    
    
    func goToFollowersFollowing(action: FollowerAndFollowingViewModel.Action, completionHandler: ((String?,Bool) -> Void)?){
        if (NetworkManager.isConnectedToNetwork()){
            appCoordinator.goToFollowersFollowing(username: username, action: action)
            completionHandler?(nil, true)
        } else {
            completionHandler?("Check your internet connection" , false)
        }
    }
    
    
}
