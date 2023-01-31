//
//  User.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 1/30/23.
//

import Foundation


struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var htmlUrl: String
    var createdAt: String
    var public_repos: Int
    var public_gists: Int
    var followers: Int
    var following: Int
    
}
