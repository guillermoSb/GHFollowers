//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 1/30/23.
//

import Foundation
import UIKit


class NetworkManager {
    static let shared =  NetworkManager()   // Make the singleton
    
    let baseUrl = "https://api.github.com"
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getFollowers(for userName: String, page: Int, limit: Int = 100, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseUrl + "/users/\(userName)/followers?per_page\(limit)&page=\(page)"
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
            }
            

        }
        
        task.resume()   // Do the network call
        
    }
    
    
    func getUserInfo(for userName: String, completed: @escaping (Result<User, GFError>) -> Void) {
        let endpoint = baseUrl + "/users/\(userName)"
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                print(data)
                let user = try decoder.decode(User.self, from: data)
                completed(.success(user))
                
            } catch {
                completed(.failure(.invalidData))
            }
    
        }
        
        task.resume()   // Do the network call
        
    }
    
}
