//
//  GFTabBarController.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 2/14/23.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarAppearence = UITabBarAppearance()
        tabBarAppearence.configureWithDefaultBackground()
        UITabBar.appearance().tintColor = .systemGreen
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearence
        viewControllers = [createSearchNavigationController(), createFavoritesNavigationController()]
        
    
    }
    

    // Search navigation controller
    func createSearchNavigationController() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return UINavigationController(rootViewController: searchVC)
    }
    
    
    // Favorites users navigation controller
    func createFavoritesNavigationController() -> UINavigationController {
        let favoritesListVC = FavoritesListVC()
        favoritesListVC.title = "Favorites"
        favoritesListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return UINavigationController(rootViewController: favoritesListVC)
    }

}
