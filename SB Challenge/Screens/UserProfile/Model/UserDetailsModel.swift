//
//  UserProfile.swift
//  SB Challenge
//
//  Created by George Kiplagat on 03/12/2022.
//

import Foundation
import RealmSwift

class UserDetailsModel: Object, Codable {

    @objc dynamic var login             : String? = nil
    @objc dynamic var id                : Int = 0
    @objc dynamic var avatarUrl         : String? = nil
    @objc dynamic var followersUrl      : String? = nil
    @objc dynamic var followingUrl      : String? = nil
    @objc dynamic var name              : String? = nil
    @objc dynamic var company           : String? = nil
    @objc dynamic var blog              : String? = nil
    @objc dynamic var location          : String? = nil
    @objc dynamic var email             : String? = nil
    @objc dynamic var bio               : String? = nil
    @objc dynamic var twitterUsername   : String? = nil
    @objc dynamic var publicRepos       : Int    = 0
    @objc dynamic var followers         : Int    = 0
    @objc dynamic var following         : Int    = 0

  enum CodingKeys: String, CodingKey {

    case login             = "login"
    case id                = "id"
    case avatarUrl         = "avatar_url"
    case followersUrl      = "followers_url"
    case followingUrl      = "following_url"
    case name              = "name"
    case company           = "company"
    case blog              = "blog"
    case location          = "location"
    case email             = "email"
    case bio               = "bio"
    case twitterUsername   = "twitter_username"
    case publicRepos       = "public_repos"
    case followers         = "followers"
    case following         = "following"
  
  }

    required init(from decoder: Decoder) throws {
        
    let values = try decoder.container(keyedBy: CodingKeys.self)

        login             = try values.decodeIfPresent(String.self , forKey: .login             )
        id                = try values.decodeIfPresent(Int.self    , forKey: .id        ) ?? 0
        avatarUrl         = try values.decodeIfPresent(String.self , forKey: .avatarUrl         )
        followersUrl      = try values.decodeIfPresent(String.self , forKey: .followersUrl      )
        followingUrl      = try values.decodeIfPresent(String.self , forKey: .followingUrl      )
        name              = try values.decodeIfPresent(String.self , forKey: .name              )
        company           = try values.decodeIfPresent(String.self , forKey: .company           )
        blog              = try values.decodeIfPresent(String.self , forKey: .blog              )
        location          = try values.decodeIfPresent(String.self , forKey: .location          )
        email             = try values.decodeIfPresent(String.self , forKey: .email             )
        bio               = try values.decodeIfPresent(String.self , forKey: .bio               )
        twitterUsername   = try values.decodeIfPresent(String.self , forKey: .twitterUsername   )
        publicRepos       = try values.decodeIfPresent(Int.self    , forKey: .publicRepos       ) ?? 0
        followers         = try values.decodeIfPresent(Int.self    , forKey: .followers         ) ?? 0
        following         = try values.decodeIfPresent(Int.self    , forKey: .following         ) ?? 0
      
        super.init()
  }
    
 
        
    override init()
        {
            super.init()
        }
        
    

}
