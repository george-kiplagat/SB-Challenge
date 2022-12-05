//
//  ApiManager.swift
//  SB Challenge
//
//  Created by George Kiplagat on 04/12/2022.
//

import Foundation

class ApiManager {
    public static let shared = ApiManager()

    func search(username: String, success: @escaping ((UserDetailsModel) -> Void), fail: @escaping ((String) -> Void)) {
        ServiceManager.shared.callService(urlString: "\(Constants.SEARCH_URL)\(username)", method: .get) { (response: UserDetailsModel?) in
            success(response!)
        } fail: { error in
            fail(error)
        }
    }
    
    func loadFollowers(username: String, page: Int, success: @escaping (([User]) -> Void), fail: @escaping ((String) -> Void)) {
        ServiceManager.shared.callService(urlString: "\(Constants.SEARCH_URL)\(username)\(Constants.FOLLOWERS_URL)\(page)", method: .get) { (response: [User]) in
            success(response)
        } fail: { error in
            fail(error)
        }
    }
    
    func loadFollowing(username: String, page: Int, success: @escaping (([User]) -> Void), fail: @escaping ((String) -> Void)) {
        ServiceManager.shared.callService(urlString: "\(Constants.SEARCH_URL)\(username)\(Constants.FOLLOWING_URL)\(page)", method: .get) { (response: [User]) in
            success(response)
        } fail: { error in
            fail(error)
        }
    }
}
