//
//  Constants.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 2/6/23.
//

import UIKit


enum SFSymbols {
    static let location = "mappin.and.ellipse"
    static let repos = "folder"
    static let gists = "text.alignleft"
    static let followers = "heart"
    static let following = "person.2"
}


enum ScreenSize {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let maxLength = max(ScreenSize.width, ScreenSize.height)
    static let minLength = min(ScreenSize.width, ScreenSize.height)
}


enum DeviceTypes {
    static let idiom = UIDevice.current.userInterfaceIdiom
    static let nativeScale = UIScreen.main.nativeScale
    static let scale = UIScreen.main.scale
    
    static let isIPhoneSE = idiom == .phone && ScreenSize.maxLength == 568.0
    static let isIPhone8Standard = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale == scale
    static let isIPhone8Zoomed = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale > scale

}


enum Images {
    static let GHLogo = UIImage(named: "gh-logo")
}


