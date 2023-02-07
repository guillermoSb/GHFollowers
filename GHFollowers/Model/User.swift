//
//  User.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 1/30/23.
//

import Foundation


struct User: Codable {
    let login: String
    let avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    let htmlUrl: String
    let createdAt: String
    let publicRepos: Int
    let publicGists: Int
    let followers: Int
    let following: Int
    
}
