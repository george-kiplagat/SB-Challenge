//
//  Constants.swift
//  SB Challenge
//
//  Created by George Kiplagat on 04/12/2022.
//

import Foundation


class Constants {

    public static let PAGE_SIZE = 10
    
    public static let SEARCH_URL = "https://api.github.com/users/"

    public static let FOLLOWERS_URL = "/followers?per_page=\(PAGE_SIZE)&page="
    public static let FOLLOWING_URL = "/following?per_page=\(PAGE_SIZE)&page="
    
}
