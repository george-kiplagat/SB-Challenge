//
//  SearchViewModel.swift
//  SB Challenge
//
//  Created by George Kiplagat on 04/12/2022.
//

import Foundation

class HomeViewModel: ObservableObject {
 
    weak var appCoordinator : HomeCoordinator!
    
    var recentSearches: [UserDetailsModel]? = []


    func goToProfile(username: String) {
    
        appCoordinator.goToProfile(username: username)
        
    }
    
    func checkConnection(username: String, completionHandler: ((Bool, String?) -> Void)?) {
    
        if(NetworkManager.isConnectedToNetwork()){
            goToProfile(username: username)
            completionHandler?(true, nil)
        } else {
            completionHandler?(false, "Check your internet connection")
        }
    }
    
    func fetchRecentSearches() {
        recentSearches = DatabaseManager.shared.fetchSearchHistory()
    }
    
    func numberOrRows() -> Int {
            return self.recentSearches?.count ?? 0
    }
 
    func getUserDetails(index: Int) -> UserDetailsModel? {
        return self.recentSearches?[index]
    }
    
}
