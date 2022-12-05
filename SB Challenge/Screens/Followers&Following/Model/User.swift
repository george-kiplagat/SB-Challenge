//
//  User.swift
//  SB Challenge
//
//  Created by George Kiplagat on 04/12/2022.
//

import Foundation

struct User: Codable {
    
    var login             : String? = nil
    var id                : Int?    = nil
    var avatarUrl         : String? = nil
    
    enum CodingKeys: String, CodingKey {
        
        case login             = "login"
        case id                = "id"
        case avatarUrl         = "avatar_url"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        login             = try values.decodeIfPresent(String.self , forKey: .login             )
        id                = try values.decodeIfPresent(Int.self    , forKey: .id                )
        avatarUrl         = try values.decodeIfPresent(String.self , forKey: .avatarUrl         )
        
    }
    
    init() {
        
    }
}
