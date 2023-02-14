//
//  GFError.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 2/6/23.
//

import Foundation


enum GFError: String, Error {
    case invalidUsername    = "This username created an invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request, please check your internet connection."
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server is invalid. Please try again."
    case unableToFavorite   = "There was an error marking this user as favorite."
    case unableToGetFavorites = "There was an error getting your favorites."
    case alreadyInFavorites = "The user is already in your favorites."
}
