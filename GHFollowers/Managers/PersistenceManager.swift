//
//  PersistenceManager.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 2/12/23.
//

import Foundation


enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    static let favoritesKey = "favorites"
    
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping(GFError?) -> Void) {
        retreiveFavorites { result in
            switch result {
            case .success(let favorites):
                var retreivedFavorites = favorites
                switch actionType {
                case .add:
                    guard !retreivedFavorites.contains(favorite) else { completed(.alreadyInFavorites); return }
                    retreivedFavorites.append(favorite)
                case .remove:
                    retreivedFavorites.removeAll { $0.login == favorite.login }
                    break
                }
                completed(save(favorites: retreivedFavorites))
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    
    static func retreiveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: favoritesKey) as? Data else {
            completed(.success([]))
            return
        }
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToGetFavorites))
        }
        
    }
    
    static func save(favorites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: favoritesKey)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
    
    
    
}
