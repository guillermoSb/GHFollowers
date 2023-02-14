//
//  Follower.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 1/30/23.
//

import Foundation

struct Follower: Codable, Hashable {
    let login: String
    let avatarUrl: String   // Will be converted by the decoder
    
}
