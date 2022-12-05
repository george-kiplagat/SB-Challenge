//
//  FollowerAndFollowingViewModel.swift
//  SB Challenge
//
//  Created by George Kiplagat on 04/12/2022.
//

import Foundation



class FollowerAndFollowingViewModel: NSObject {
    
    weak var appCoordinator : HomeCoordinator!

    var username: String!
    var currentPage = 1
    
    var isFetchInProgress = false
    var isEndOfList = false
    
    var action:Action!

    var users: [User]? = []

    func goToPreviousScreen(){
        appCoordinator.goBack()
    }

    init(username: String, action: Action) {
        super.init()
        self.username = username
        self.action = action
    }

    func callService(completionHandler: (([User]?, Bool) -> Void)?) {
        
        self.isFetchInProgress = true
        
        switch action{
        case .Followers:
            ApiManager.shared.loadFollowers(
                username: self.username,
                page: currentPage,
                success: { [weak self] response in
                    self?.currentPage += 1
                    self?.users?.append(contentsOf: response)
                    
                    if (response.isEmpty || response.count < Constants.PAGE_SIZE){
                        self?.isEndOfList = true
                    }
            
                    completionHandler?(response, true)
                    self?.isFetchInProgress = false
                    
                },
                fail: { [weak self] _ in
                    self?.isFetchInProgress = false
                    completionHandler?(nil, false)
                })
            break
            
        case .Following:
            ApiManager.shared.loadFollowing(
                username: self.username,
                page: currentPage,
                success: { [weak self] response in
                    self?.currentPage += 1
                    self?.users?.append(contentsOf: response)
                    
                    if (response.isEmpty || response.count < Constants.PAGE_SIZE){
                        self?.isEndOfList = true
                    }
                    
                    completionHandler?(response, true)
                    self?.isFetchInProgress = false
                    
                },
                fail: { [weak self] _ in
                    self?.isFetchInProgress = false
                    completionHandler?(nil, false)
                })
            break
            
        case .none:
            break
        }
        
    }

   
    
    func numberOrRows() -> Int {
            return self.users?.count ?? 0
    }
    
    func getUser(index: Int) -> User? {
        return self.users?[index]
    }
    
    func goToProfileSearch(username: String){
        appCoordinator.goToProfile(username: username)
    }

}

extension FollowerAndFollowingViewModel {
    enum Action {
        case Following
        case Followers
    }
}
